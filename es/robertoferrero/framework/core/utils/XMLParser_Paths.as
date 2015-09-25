/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 11/05/2009 11:37
*/
package es.robertoferrero.framework.core.utils{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.data.Datos;
	import es.robertoferrero.framework.core.Paths
	import es.robertoferrero.framework.xml.XMLParser
	import es.robertoferrero.framework.xml.utils.XMLUtils
	import flash.xml.XMLNode;
	//---------------------------
	// CLASSES del Package:
	public class XMLParser_Paths implements XMLParser{
		// import es.robertoferrero.framework.core.utils.XMLParser_Paths
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		private var xml:XML
		private var data:Datos
		public var nombreNodo:String
		//------------
		// CONSTRUCTORA:
		public function XMLParser_Paths(_nombreNodo:String = "paths"){
			// trace ("(XMLParser_Paths.CONSTRUCTORA)!")
			nombreNodo = _nombreNodo
			data = new Datos("data_XMLParser_Paths")
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
			trace ("(XMLParser_Paths.interpretar)!")
			var nodo:XMLList = xml.child(nombreNodo)
			var subNodos:XMLList = nodo.children()
			trace("nodo: " + nodo)
			trace("subNodos: " + subNodos)
			for (var i in subNodos) {
				trace("-----")
				var pathId:String = subNodos[i].attribute("id")
				var destino:String =  subNodos[i].attribute("target")
				var path:String = subNodos[i]
				//--
				Paths.nuevoPath(pathId, path, destino)
			}
		}
		//------------
		// EVENTOS:
		
	}
	
}