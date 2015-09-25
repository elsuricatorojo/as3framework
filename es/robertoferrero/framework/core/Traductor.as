/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 11/05/2009 11:35
*/
package es.robertoferrero.framework.core{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.core.utils.XMLParser_Traductor
	import es.robertoferrero.framework.data.Datos;
	import es.robertoferrero.framework.utils.ArrayUtils
	//---------------------------
	// CLASSES del Package:
	public class Traductor{
		// import es.robertoferrero.framework.core.Traductor
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		private static var inst:Traductor;
		private static var count:Number = 0;
		private static var data:Datos
		private static var _idioma:String = null
		// Preferencias:
		public static var remplazar:Boolean = false // Indica si una traducción ya existe se remplaza si se encuentra otra.
		//------------
		// CONSTRUCTORA:
		public function Traductor(){
			trace ("(Traductor.CONSTRUCTORA)!")
			data = new Datos("data_traductor")
			
		}
		// Singelton:
		public static function getInstance ():Traductor{
			if (inst == null)	{
				inst = new Traductor ();
			}
			++count;
			return inst;
		}
		//------------
		// PUBLICOS:
		public static function setXML(objXML:XML, nombreNodo:String = "traductor"):void {
			trace("(Traductor.setXML)!")
			var parser:XMLParser_Traductor = new XMLParser_Traductor(nombreNodo)
			parser.remplazar = remplazar
			parser.setXML(objXML)
		}
		static public function nuevoTermino(terminoId:String):void {
			var existe:Boolean = data.existeItem(terminoId)
			if (!existe) {
				var obj:Object = new Object()
				obj.idiomas = new Datos("idiomas")
				obj.terminoId = terminoId
				data.nuevoItem(terminoId, obj)
			}else {
				trace("(Traductor.nuevoTermino)!")
				trace("ATENCION: El termino pasado ("+terminoId+") YA existe. No se hace nada.")
			}
		}
		static public function nuevaTraduccion(terminoId:String, idiomaId:String, traduccion:String, remplazar:Boolean) {
			trace("(Traductor.nuevaTraduccion) "+terminoId+"/"+idiomaId+": "+traduccion)
			if (remplazar != true) {
				remplazar = false
			}
			var existe:Boolean =data.existeItem(terminoId)
			if (!existe) {
				trace("ATENCION: El termino pasado ("+terminoId+") NO existe. Lo creamos.")
				nuevoTermino(terminoId)
			}
			var objTermino:Object = data.getItem(terminoId)
			var existeIdioma:Boolean = objTermino.idiomas.existeItem(idiomaId)
			var objIdioma:Object
			if (!existeIdioma) {
				objIdioma = new Object()
				objIdioma.idiomaId = idiomaId
				objIdioma.traduccion = traduccion
				objTermino.idiomas.nuevoItem(idiomaId, objIdioma)
			}else {
				objIdioma = objTermino.idiomas.getItem(idiomaId)
				trace("ATENCION: Ya existe una traduccion de ese termino para ese idioma:")
				trace("    terminoId: " + terminoId)
				trace("    idiomaId: " + idiomaId)
				trace("    traduccion existente: " + objIdioma.traduccion)
				trace("    traduccion nueva: " + traduccion)
				if (remplazar) {
					trace("Al ser remplazar=true, remplazamos por la nueva traduccion.")
					objIdioma.traduccion = traduccion
				}else {
					trace("Al ser remplazar=false, dejamos la antigua traduccion.")
				}
			}
		}
		static public function traducir(terminoId):String {
			var traduccion:String
			if (_idioma!=null) {
				var existeTermino:Boolean = data.existeItem(terminoId)
				var existeIdioma:Boolean
				if (existeTermino) {
					var objTermino:Object = data.getItem(terminoId)
					existeIdioma = objTermino.idiomas.existeItem(_idioma)
					if (existeIdioma) {
						var objIdioma:Object = objTermino.idiomas.getItem(_idioma)
						traduccion = objIdioma.traduccion
					}else {
						trace("(Traductor.traducir)!")
						trace("   ATENCION: No existe una traduccion para el idioma "+_idioma+" del termino: "+terminoId+".  Se devuelve el código del término.")
						traduccion = terminoId
					}
				}else {
					trace("(Traductor.traducir)!")
					trace("   ATENCION: No existe el termino solicitado ("+terminoId+").  Se devuelve el código del término.")
					traduccion = terminoId
				}
			}else {
				trace("(Traductor.traducir)!")
				trace("   ATENCION: No se ha establecido un idioma. (idioma==null)")
				traduccion = null
			}
			return traduccion
		}
		// Getters/Setters:
		static public function get idioma():String { return _idioma; }
		static public function set idioma(value:String):void{
			_idioma = value;
		}
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		//------------
		// EVENTOS:
		
	}
	
}