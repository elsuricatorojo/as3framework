/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 11/05/2009 11:34
*/
package es.robertoferrero.framework.core{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.core.utils.XMLParser_Params
	import es.robertoferrero.framework.data.Datos;
	import es.robertoferrero.framework.utils.ArrayUtils
	//---------------------------
	// CLASSES del Package:
	public class Params{
		// import es.robertoferrero.framework.core.Params
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		private static var inst:Params;
		private static var count:Number = 0;
		private static var data:Datos
		//------------
		// CONSTRUCTORA:
		public function Params(){
			trace ("(Params.CONSTRUCTORA)!")
			data = new Datos("data_config")
		}
		// Singelton:
		public static function getInstance ():Params{
			if (inst == null)	{
				inst = new Params ();
			}
			++count;
			return inst;
		}
		//------------
		// PUBLICOS:
		public static function setXML(objXML:XML, nombreNodo:String = "config"):void {
			trace("(Params.setXML)!")
			var parser:XMLParser_Params = new XMLParser_Params(nombreNodo)
			parser.setXML(objXML)
		}
		public static  function nuevoParam(paramId:String, valor:String):void {
			trace("(Params.nuevoParam) paramId: "+paramId+" = "+valor)
			var existe:Boolean = data.existeItem(paramId)
			if(!existe){
				var dataTemp:Object = new Object()
				dataTemp.paramId = paramId
				dataTemp.valor = valor
				data.nuevoItem(paramId, dataTemp)
			}else {
				trace("(Params.nuevoParam) ATENCION: Ya existe el parametro que se quiere añadir: "+paramId)
			}
		}
		// Getters/Setters:
		//------------
		// PRIVADOS:
		public static function getParam(paramId:String) {
			trace("(Params.getParam): "+paramId)
			var existe:Boolean = data.existeItem(paramId)
			if (existe) {
				return data.getItem(paramId).valor
			}else {
				trace("ATENCION: El parametro solicitado ("+paramId+") NO existe. Se devuelve null")
				return null	
			}
		}
		//------------
		// EVENTOS:
		
	}
}