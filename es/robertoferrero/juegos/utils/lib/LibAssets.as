/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 18/01/2011 18:11
*/
package es.robertoferrero.juegos.utils.lib{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.data.Datos;
	import es.robertoferrero.framework.loaders.Buffer;
	import es.robertoferrero.framework.loaders.Cargador;
	import es.robertoferrero.framework.loaders.CargadorDisplayObj;
	import es.robertoferrero.framework.loaders.CargadorMP3;
	import es.robertoferrero.framework.loaders.CargadorXML;
	import es.robertoferrero.framework.xml.XMLParser
	import es.robertoferrero.framework.xml.utils.XMLUtils
	//--
	import es.robertoferrero.juegos.IMainJuego;
	import es.robertoferrero.juegos.utils.datos.DataAsset;
	import es.robertoferrero.juegos.utils.datos.TiposAssets;
	import es.robertoferrero.juegos.utils.xml.XMLParser_Assets
	//--
	import flash.xml.XMLNode;
	//---------------------------
	// CLASSES del Package:
	public class LibAssets{
		// import es.robertoferrero.juegos.utils.lib.LibAssets
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		private var data:Datos
		private var main:IMainJuego
		//--
		public  var mainConfigXML:XML
		//------------
		// CONSTRUCTORA:
		public function LibAssets(_main:IMainJuego){
			trace ("(LibAssets.CONSTRUCTORA)!")
			main = _main
			data = new Datos("assets_juego")
		}
		//------------
		// PUBLICOS:
		public function setXML(objXML:XML, esMainConfigXML:Boolean = false, nombreNodo:String = "assets"):void {
			trace("(LibAssets.setXML)!")
			var parser:XMLParser_Assets = new XMLParser_Assets(nombreNodo)
			parser.setXML(objXML)
			data.fundirDatos(parser.getDatos(), true)
			//--
			if (mainConfigXML) {
				mainConfigXML = objXML
			}
		}
		public function registrarCargas(buffer:Buffer):void {
			trace("(LibAssets.registrarCargas)!")
			var velocidadCarga:Number = Number(main.get_params().getParamSiExsite("MAIN_VEL_CARGA_ASSETS", 5))
			trace("   velocidadCarga: "+velocidadCarga)
			for (var i = 0; i < data.arrayItems.length; i++ ) {
				var assetId:String = data.arrayItems[i]
				var dataAsset:DataAsset = data.getItem(assetId) as DataAsset
				trace("   Añadimos la carga: " + dataAsset.itemId)
				var cargador:Cargador
				switch(dataAsset.tipo) {
					case TiposAssets.TIPO_INTRO:
						cargador = new CargadorDisplayObj(dataAsset.url, dataAsset.itemId, buffer, velocidadCarga) as Cargador;
						break;
					case TiposAssets.TIPO_MENU:
						cargador = new CargadorDisplayObj(dataAsset.url, dataAsset.itemId, buffer, velocidadCarga) as Cargador;
						break;
					case TiposAssets.TIPO_IMG:
						cargador = new CargadorDisplayObj(dataAsset.url, dataAsset.itemId, buffer, velocidadCarga) as Cargador;
						break;
					case TiposAssets.TIPO_SWF:
						cargador = new CargadorDisplayObj(dataAsset.url, dataAsset.itemId, buffer, velocidadCarga) as Cargador;
						break;
					case TiposAssets.TIPO_XML:
						cargador = new CargadorXML(dataAsset.url, dataAsset.itemId, buffer) as Cargador;
						break;
					case TiposAssets.TIPO_MP3:
						cargador = new CargadorMP3(dataAsset.url, dataAsset.itemId, buffer, velocidadCarga) as Cargador;
						break;
				}
				buffer.nuevaCarga(cargador, dataAsset.peso)
			}
		}
		// Getters:
		public function getAssetRef(assetId:String):Object {
			trace("(LibAssets.getAssetRef): "+assetId)
			var existe:Boolean = data.existeItem(assetId)
			if(existe){
				var asset:DataAsset = data.getItem(assetId) as DataAsset
				return asset.ref
			}else {
				return null
			}
		}
		public function getTipoAsset(assetId:String):String {
			var existe:Boolean = data.existeItem(assetId)
			var valor:String = null
			if (existe) {
				var asset:DataAsset = data.getItem(assetId) as DataAsset
				valor = asset.tipo
			}
			return valor
		}
		// Setters:
		public function setAssetRef(assetId:String, ref:Object):void {
			trace("(LibAssets.setAssetRef): "+assetId+"   ref: "+ref)
			var existe:Boolean = data.existeItem(assetId)
			if (existe) {
				var asset:DataAsset = data.getItem(assetId) as DataAsset
				asset.setRef(ref)
			}
		}
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		//------------
		// EVENTOS:
		
	}
	
}