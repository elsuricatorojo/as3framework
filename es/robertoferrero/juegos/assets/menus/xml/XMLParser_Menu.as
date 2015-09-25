/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 17/01/2011 13:22
*/
package es.robertoferrero.juegos.assets.menus.xml{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.data.Datos;
	import es.robertoferrero.framework.xml.XMLParser
	import es.robertoferrero.framework.xml.utils.XMLUtils
	import es.robertoferrero.juegos.assets.menus.datos.DataOpcionMenu
	//---------------------------
	// CLASSES del Package:
	public class XMLParser_Menu implements XMLParser{
		// import es.robertoferrero.juegos.utils.xml.XMLParser_Params
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		private var xml:XML
		private var data:Datos
		public var nombreNodo:String
		public var nombreSubopciones:String = "subopciones"
		//--
		public var dataMenu:DataOpcionMenu
		//------------
		// CONSTRUCTORA:
		public function XMLParser_Menu(_nombreNodo:String = "menu"){
			// trace ("(XMLParser_Menu.CONSTRUCTORA)!")
			nombreNodo = _nombreNodo
			dataMenu = new DataOpcionMenu("root", "ROOT", 0)
			data = dataMenu.subopciones
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
		public function getDataMenu():DataOpcionMenu {
			return dataMenu
		}
		//------------
		// PRIVADOS:
		private function interpretar():void {
			trace ("(XMLParser_Menu.interpretar)!")
			var nodo:XMLList = xml.child(nombreNodo)
			var subNodos:XMLList = nodo.children()
			interpretarSubopciones(nodo, dataMenu)
		}
		private function interpretarSubopciones(nodo:XMLList, dataOpcionParent:DataOpcionMenu):void {
			var subNodos:XMLList = nodo.children()
			for (var i in subNodos) {
				var nodoTemp:XML = subNodos[i]
				var hijos:XMLList = nodoTemp.children()
				var opcionId:String = nodoTemp.attribute("id")
				var nombre:String = XMLUtils.getValorNodo(hijos, "nombre")
				//--
				var dataOpcion:DataOpcionMenu = new DataOpcionMenu(opcionId, nombre)
				dataOpcionParent.nuevaSubopcion(dataOpcion)
				//--
				var existenSubopciones:Boolean = XMLUtils.evalExisteNodo(hijos, nombreSubopciones)
				if (existenSubopciones) {
					var subopcionesList:XMLList = nodoTemp.child(nombreSubopciones)
					interpretarSubopciones(subopcionesList, dataOpcion)
				}
			}
		}
		//------------
		// EVENTOS:
		
	}
	
}