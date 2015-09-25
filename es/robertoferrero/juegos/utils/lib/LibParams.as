/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 17/01/2011 12:56
*/
package es.robertoferrero.juegos.utils.lib{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.data.Datos;
	import es.robertoferrero.framework.utils.ArrayUtils
	import es.robertoferrero.juegos.IMainJuego;
	//--
	import es.robertoferrero.juegos.utils.xml.XMLParser_Params
	//---------------------------
	// CLASSES del Package:
	public class LibParams{
		// import es.robertoferrero.juegos.utils.lib.LibParams
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		private var data:Datos
		private var main:IMainJuego
		//------------
		// CONSTRUCTORA:
		public function LibParams(_main:IMainJuego){
			// trace ("(LibParams.CONSTRUCTORA)!")
			main = _main
			data = new Datos("data_params")
			
		}
		//------------
		// PUBLICOS:
		public function setXML(objXML:XML, nombreNodo:String = "params"):void {
			trace("(LibParams.setXML)!")
			var parser:XMLParser_Params = new XMLParser_Params(nombreNodo)
			parser.setXML(objXML)
			data.fundirDatos(parser.getDatos(), true)
		}
		public function nuevoParam(paramId:String, valor:Object):void {
			trace("(LibParams.nuevoParam) paramId: "+paramId+" = "+valor)
			var existe:Boolean = data.existeItem(paramId)
			if(!existe){
				var dataParam:Object = new Object()
				dataParam.paramId = paramId
				dataParam.valor = valor
				data.nuevoItem(paramId, dataParam)
			}else {
				trace("(LibParams.nuevoParam) ATENCION: Ya existe el parametro que se quiere añadir: "+paramId)
			}
		}
		// Getters:
		public function getParam(paramId:String):Object {
			var existe:Boolean = data.existeItem(paramId)
			var valor = null
			if (existe) {
				valor = data.getItem(paramId)
			}
			return valor
		}
		public function getParamSiExsite(paramId:String, valorDefault:Object = null):Object {
			//trace("(LibParams.getParamSiExsite): "+paramId+" default:"+valorDefault)
			var existe:Boolean = data.existeItem(paramId)
			//trace("   existe: "+existe)
			var valor = null
			if (existe) {
				valor = data.getItem(paramId)
			}else {
				trace("(LibParams.getParamSiExsite): NO existe el param: "+paramId+", se devuelve el valor por defecto pasado: "+valorDefault)
				valor = valorDefault
			}
			return valor
		}
		// Setters:
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		//------------
		// EVENTOS:
		
	}
	
}