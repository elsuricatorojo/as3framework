/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 22/02/2011 12:03
*/
package es.robertoferrero.framework.assets{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.loaders.Buffer;
	import es.robertoferrero.framework.loaders.CargadorDisplayObj;
	import es.robertoferrero.framework.loaders.eventos.EventoCarga;
	import flash.events.EventDispatcher;
	//---------------------------
	// CLASSES del Package:
	public class AssetLoader extends EventDispatcher implements IAssetLib{
		// import es.robertoferrero.framework.assets.AssetLoader
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		private var buffer:Buffer
		private var assetLib:IAssetLib = null
		//------------
		// CONSTRUCTORA:
		public function AssetLoader(){
			trace ("(AssetLoader.CONSTRUCTORA)!")
			//--
			buffer = new Buffer("assetLoader_buffer")
			buffer.addEventListener(EventoCarga.EXITO_CARGA, onExitoCarga)
			buffer.addEventListener(EventoCarga.PROGRESS_CARGA, onProgressCarga)
			buffer.addEventListener(EventoCarga.TODO_CARGADO, onTodoCargado)
		}
		//------------
		// PUBLICOS:
		// Obligados por el interface IAssetLib:
		public function nuevoAsset(assetId:String, asset:IAsset):void {
			assetLib.nuevoAsset(assetId, asset)
		}
		public function getAsset(assetId:String):IAsset {
			var asset:IAsset = assetLib.getAsset(assetId) as IAsset
			return asset
		}
		public function getAssetCopy(assetId:String):IAsset {
			var asset:IAsset = assetLib.getAsset(assetId) as IAsset
			var copy:IAsset = asset.getCopy() as IAsset
			return copy
		}
		//--
		public function init():void {
			if (assetLib==null) {
				assetLib = AssetLibSingelton.getInstance()
			}
			//--
			buffer.init()
		}
		public function setAssetLib(assetLib:IAssetLib):void {
			this.assetLib = assetLib
		}
		public function nuevaCarga(assetId:String, path:String):void {
			var cargador:CargadorDisplayObj = new CargadorDisplayObj(path, assetId, buffer)
			buffer.nuevaCarga(cargador, 1)
		}
		// Getters:
		// Setters:
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		//------------
		// EVENTOS:
		private function onExitoCarga(evento:EventoCarga):void {
			var asset:IAsset = evento.data.loader.content as IAsset
			assetLib.nuevoAsset(evento.cargaId, asset)
			//--
			var evento2:EventoCarga = evento.clone() as EventoCarga
			this.dispatchEvent(evento2)
			//--
			buffer.resumir()
		}
		private function onProgressCarga(evento:EventoCarga):void {
			var evento2:EventoCarga = evento.clone() as EventoCarga
			this.dispatchEvent(evento2)
		}
		private function onTodoCargado(evento:EventoCarga):void {
			var evento2:EventoCarga = evento.clone() as EventoCarga
			this.dispatchEvent(evento2)
		}
	}
	
}