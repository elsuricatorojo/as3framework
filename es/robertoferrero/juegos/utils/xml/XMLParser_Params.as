/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 17/01/2011 13:22
*/
package es.robertoferrero.juegos.utils.xml{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.data.Datos;
	import es.robertoferrero.framework.xml.XMLParser
	import es.robertoferrero.framework.xml.utils.XMLUtils
	import flash.xml.XMLNode;
	//---------------------------
	// CLASSES del Package:
	public class XMLParser_Params implements XMLParser{
		// import es.robertoferrero.juegos.utils.xml.XMLParser_Params
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		private var xml:XML
		private var data:Datos
		public var nombreNodo:String
		//------------
		// CONSTRUCTORA:
		public function XMLParser_Params(_nombreNodo:String = "params"){
			// trace ("(XMLParser_Params.CONSTRUCTORA)!")
			nombreNodo = _nombreNodo
			data = new Datos("data_XMLParser_Params")
		}
		//------------
		// PUBLICOS:
		public function setXML(objXML:XML):void {
			xml = objXML
			interpretar()
		}
		public function getXML():XML {
			return xml
		}
		public function getDatos():Datos {
			return data
		}
		//------------
		// PRIVADOS:
		private function interpretar():void {
			trace ("(XMLParser_Params.interpretar)!")
			var nodo:XMLList = xml.child(nombreNodo)
			var subNodos:XMLList = nodo.children()
			trace("nodo: " + nodo)
			trace("subNodos: " + subNodos)
			for (var i in subNodos) {
				trace("-----")
				var paramId:String = subNodos[i].attribute("id")
				var valor:String = subNodos[i]
				//--
				trace("   AÑADIMOS: "+paramId+" = "+valor)
				//--
				data.nuevoItem(paramId, valor)
			}
		}
		//------------
		// EVENTOS:
		
	}
	
}