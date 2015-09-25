/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 13/05/2009 10:45
*/
package es.robertoferrero.framework.core.utils{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.data.Datos;
	import es.robertoferrero.framework.core.Traductor
	import es.robertoferrero.framework.xml.XMLParser
	import es.robertoferrero.framework.xml.utils.XMLUtils
	import flash.xml.XMLNode;
	//---------------------------
	// CLASSES del Package:
	public class XMLParser_Traductor implements XMLParser{
		// import es.robertoferrero.framework.core.utils.XMLParser_Traductor
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		private var xml:XML
		private var data:Datos
		public var nombreNodo:String
		// Preferencias:
		public var remplazar:Boolean = false // Indica si una traducción ya existe se remplaza si se encuentra otra.
		//------------
		// CONSTRUCTORA:
		public function XMLParser_Traductor(_nombreNodo:String = "traductor"){
			// trace ("(XMLParser_Traductor.CONSTRUCTORA)!")
			nombreNodo = _nombreNodo
			data = new Datos("data_XMLParser_Traductor")
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
			trace ("(XMLParser_Traductor.interpretar)!")
			var nodo:XMLList = xml.child(nombreNodo)
			var subNodos:XMLList = nodo.children()
			trace("nodo: " + nodo)
			trace("subNodos: " + subNodos)
			for (var i in subNodos) {
				trace("-----")
				var terminoId:String = subNodos[i].attribute("id")
				Traductor.nuevoTermino(terminoId)
				//--
				trace("   terminoId: " + terminoId)
				var nodos_traduccion:XMLList = subNodos[i].children()
				for (var j in nodos_traduccion) {
					var traduccionId:String = nodos_traduccion[j].attribute("id")
					var traduccion:String = nodos_traduccion[j]
					trace("      traduccionId: " + traduccionId + " / " + traduccion)
					Traductor.nuevaTraduccion(terminoId, traduccionId, traduccion, remplazar)
				}
				//--
				//Traductor.nuevoPath(pathId, path, destino)
			}
		}
		//------------
		// EVENTOS:
		
	}
	
}