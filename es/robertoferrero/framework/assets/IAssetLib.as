/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 07/02/2011 19:49
*/
package es.robertoferrero.framework.assets {
	import flash.events.IEventDispatcher;
	//--
	public interface IAssetLib {
		function nuevoAsset(assetId:String, asset:IAsset):void
		function getAsset(assetId:String):IAsset
		function getAssetCopy(assetId:String):IAsset 
	}
}