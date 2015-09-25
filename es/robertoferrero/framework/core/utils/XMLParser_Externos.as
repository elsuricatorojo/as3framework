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
	import es.robertoferrero.framework.core.datos.DataExternos;
	import es.robertoferrero.framework.core.datos.TipoExternos;
	import es.robertoferrero.framework.data.Datos;
	import es.robertoferrero.framework.core.Externos
	import es.robertoferrero.framework.xml.XMLParser
	import es.robertoferrero.framework.xml.utils.XMLUtils
	import flash.xml.XMLNode;
	//---------------------------
	// CLASSES del Package:
	public class XMLParser_Externos implements XMLParser{
		// import es.robertoferrero.framework.core.utils.XMLParser_Externos
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		private var xml:XML
		private var data:Datos
		public var nombreNodo:String
		//------------
		// CONSTRUCTORA:
		public function XMLParser_Externos(_nombreNodo:String = "externos"){
			// trace ("(XMLParser_Externos.CONSTRUCTORA)!")
			nombreNodo = _nombreNodo
			data = new Datos("data_XMLParser_Externos")
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
			trace ("(XMLParser_Externos.interpretar)!")
			var nodo:XMLList = xml.child(nombreNodo)
			var subNodos:XMLList = nodo.children()
			trace("nodo: " + nodo)
			trace("subNodos: " + subNodos)
			for (var i in subNodos) {
				trace("-----")
				var externoId:String = subNodos[i].attribute("id")
				var peso:Number =  Number(subNodos[i].attribute("peso"))
				var tipo:String =  subNodos[i].attribute("tipo")
				tipo = tipo.toLowerCase()
				if (tipo == "img") {
					tipo = TipoExternos.TIPO_IMG
				}else if (tipo == "swf") {
					tipo = TipoExternos.TIPO_SWF
				}else if (tipo == "mp3") {
					tipo = TipoExternos.TIPO_MP3
				}else if (tipo == "xml") {
					tipo = TipoExternos.TIPO_XML
				}else {
					tipo = TipoExternos.TIPO_OTRO
				}
				var path:String = subNodos[i]
				//--
				var dataExterno:DataExternos = new DataExternos()
				dataExterno.externoId = externoId
				dataExterno.peso = peso
				dataExterno.tipo = tipo
				dataExterno.path = path
				//--
				trace("  externoId: "+externoId)
				trace("  peso: "+peso)
				trace("  tipo: "+tipo)
				trace("  path: "+path)
				//--
				Externos.nuevoExterno(dataExterno)
			}
		}
		//------------
		// EVENTOS:
		
	}
	
}