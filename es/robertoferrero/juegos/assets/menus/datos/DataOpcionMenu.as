/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 25/01/2011 19:31
*/
package es.robertoferrero.juegos.assets.menus.datos{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.data.Datos;
	//---------------------------
	// CLASSES del Package:
	public class DataOpcionMenu{
		// import es.robertoferrero.juegos.assets.menus.datos.DataOpcionMenu
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		public var opcionId:String
		public var texto:String
		public var rango:int
		public var subopciones:Datos
		public var opcionParent:DataOpcionMenu
		//------------
		// CONSTRUCTORA:
		public function DataOpcionMenu(_opcionId:String, _texto:String, _rango:int = 0, _subopciones:Datos=null, _opcionParent:DataOpcionMenu=null) {
			//trace ("(DataOpcionMenu.CONSTRUCTORA) opcionId: "+_opcionId+"   texto: "+_texto)
			opcionId = _opcionId
			texto = _texto
			rango = _rango
			opcionParent = _opcionParent
			//--
			if (subopciones == null) {
				subopciones = new Datos(opcionId+"_subopciones")
			}else {
				subopciones = _subopciones
			}
		}
		//------------
		// PUBLICOS:
		public function nuevaSubopcion(subopcion:DataOpcionMenu):void {
			subopcion.rango = this.rango + 1
			subopcion.opcionParent = this
			subopcion.traceData()
			subopciones.nuevoItem(subopcion.opcionId, subopcion)
		}
		public function traceData():void {
			trace("------------------")
			trace("(DataOpcionMenu)!")
			trace("   opcionId: "+opcionId)
			trace("   texto: "+texto)
			trace("   rango: "+rango)
			trace("   opcionParent: "+opcionParent)
			trace("   subopciones: " + subopciones)
			trace("------------------")
		}
		// Getters:
		// Setters:
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		//------------
		// EVENTOS:
		
	}
	
}