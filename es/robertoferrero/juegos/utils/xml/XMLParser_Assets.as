/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 17/01/2011 13:23
*/
package es.robertoferrero.juegos.utils.xml{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.data.Datos;
	import es.robertoferrero.framework.xml.XMLParser
	import es.robertoferrero.framework.xml.utils.XMLUtils
	//--
	import es.robertoferrero.juegos.utils.datos.DataAsset;
	import es.robertoferrero.juegos.utils.datos.TiposAssets
	//--
	import flash.xml.XMLNode;
	//---------------------------
	// CLASSES del Package:
	public class XMLParser_Assets implements XMLParser{
		// import es.robertoferrero.juegos.utils.XMLParser_Assets
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		private var xml:XML
		private var data:Datos
		public var nombreNodo:String
		//------------
		// CONSTRUCTORA:
		public function XMLParser_Assets(_nombreNodo:String = "assets"){
			// trace ("(XMLParser_Assets.CONSTRUCTORA)!")
			nombreNodo = _nombreNodo
			data = new Datos("data_assets")
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
			trace ("(XMLParser_Assets.interpretar)!")
			var nodo:XMLList = xml.child(nombreNodo)
			var subNodos:XMLList = nodo.children()
			trace("nodo: " + nodo)
			trace("subNodos: " + subNodos)
			for (var i in subNodos) {
				trace("-----")
				var itemId:String = subNodos[i].attribute("id")
				var url:String = subNodos[i]
				var peso:Number =  Number(subNodos[i].attribute("peso"))
				var valor_tipo:String = subNodos[i].attribute("tipo")
				var tipo:String = TiposAssets.TIPO_OTRO
				switch(valor_tipo) {
					case "intro":
						tipo = TiposAssets.TIPO_INTRO;
						break;
					case "menu":
						tipo = TiposAssets.TIPO_MENU;
						break;
					case "img":
						tipo = TiposAssets.TIPO_IMG;
						break;
					case "swf":
						tipo = TiposAssets.TIPO_SWF;
						break;
					case "xml":
						tipo = TiposAssets.TIPO_XML;
						break;
					case "mp3":
						tipo = TiposAssets.TIPO_MP3;
						break;
				}
				//--
				var dataAsset:DataAsset = new DataAsset(itemId, url, tipo, peso)
				//--
				data.nuevoItem(itemId, dataAsset)
			}
		}
		//------------
		// EVENTOS:
		
	}
	
}