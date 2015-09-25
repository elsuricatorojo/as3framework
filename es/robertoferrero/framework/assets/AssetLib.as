/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 22/02/2011 12:03
* IMPORTANTE: Todas las clases del paquete com.ionewmedia que extienden MovieClip
*             vinculados a elementos de biblioteca requieren desactivar:
*             "Declaracion instancias de escenario automaticamente" en "Configuración de publicación" en (CS3).
* IMPORTAT: All classes inside the com.ionewmedia package that extends MovieClip and are linked to Library items
*             need the "Automatically declare stage instances" UNCHECKED in "Publish Settings" (CS3)
*/
package es.robertoferrero.framework.assets{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.data.Datos;
	//---------------------------
	// CLASSES del Package:
	public class AssetLib implements IAssetLib{
		// import es.robertoferrero.framework.assets.AssetLib
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		private var data:Datos
		//------------
		// CONSTRUCTORA:
		public function AssetLib(){
			trace ("(AssetLib.CONSTRUCTORA)!")
			data = new Datos("assetLib_data")
		}
		//------------
		// PUBLICOS:
		// Obligados por el interface IAssetLib
		public function nuevoAsset(assetId:String, asset:IAsset):void {
			trace ("(AssetLib.nuevoAsset): "+assetId)
			var existe:Boolean = data.existeItem(assetId)
			if (!existe) {
				data.nuevoItem(assetId, asset)
			}else {
				trace("ATENCION: Se está intentando crear un asset con una id que ya existe")
			}
		}
		public function getAsset(assetId:String):IAsset {
			trace ("(AssetLib.getAsset): "+assetId)
			var existe:Boolean = data.existeItem(assetId)
			if (existe) {
				var asset:IAsset = data.getItem(assetId) as IAsset
				return asset
			}else {
				trace("ATENCION: Se está solicitando un asset con una id que ya existe")
				return null
			}
		}
		public function getAssetCopy(assetId:String):IAsset {
			trace ("(AssetLib.getAsset): "+assetId)
			var existe:Boolean = data.existeItem(assetId)
			if (existe) {
				var asset:IAsset = data.getItem(assetId) as IAsset
				var copy:IAsset = asset.getCopy() as IAsset
				return copy
			}else {
				trace("ATENCION: Se está solicitando un asset con una id que NO existe")
				return null
			}
		}
		// Getters:
		// Setters:
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		//------------
		// EVENTOS:
		
	}
	
}