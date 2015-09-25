/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 22/02/2011 12:19
* IMPORTANTE: Todas las clases del paquete com.ionewmedia que extienden MovieClip
*             vinculados a elementos de biblioteca requieren desactivar:
*             "Declaracion instancias de escenario automaticamente" en "Configuración de publicación" en (CS3).
* IMPORTAT: All classes inside the com.ionewmedia package that extends MovieClip and are linked to Library items
*             need the "Automatically declare stage instances" UNCHECKED in "Publish Settings" (CS3)
*/
package es.robertoferrero.framework.assets{
	//---------------------------
	// IMPORTS del Package:
	//---------------------------
	// CLASSES del Package:
	public class AssetLibSingelton implements IAssetLib{
		// import es.robertoferrero.framework.assets.AssetLibSingelton
		//------------
		// DOCUMENTACION:
		import es.robertoferrero.framework.data.Datos;
		//------------
		// PARAMETROS:
		private static var instance:AssetLibSingelton;
		private static var allowInstantiation:Boolean = false;
		private static var construida:Boolean = false;
		//--
		private static var data:Datos
		private static var assetLib:AssetLib
		//------------
		// CONSTRUCTORA:
		public function AssetLibSingelton(){
			trace ("(AssetLibSingelton.CONSTRUCTORA)!")
			if (allowInstantiation) {
				construida = true
				assetLib = new AssetLib()
			}else {
				throw new Error("Error: Instantiation failed: Use SingletonDemo.getInstance() instead of new.");
			}
		}
		public static function getInstance():AssetLibSingelton {
			trace("(AssetLibSingelton.getInstance)!")
			if (instance == null) {
				allowInstantiation = true;
				instance = new AssetLibSingelton();
				allowInstantiation = false;
			}
			return instance;
		}
		//------------
		// PUBLICOS:
		// Obligados por el interface IAssetLib:
		public function nuevoAsset(assetId:String, asset:IAsset):void {
			assetLib.nuevoAsset(assetId, asset)
		}
		public function getAsset(assetId:String):IAsset {
			return assetLib.getAsset(assetId)
		}
		public function getAssetCopy(assetId:String):IAsset {
			return assetLib.getAssetCopy(assetId)
		}
		//--
		// Accesos staticos:
		public static function nuevoAsset2(assetId:String, asset:IAsset):void {
			trace("(AssetLibSingelton.nuevoAsset2)!")
			if(construida){
				assetLib.nuevoAsset(assetId, asset)
			}
		}
		public static function getAsset2(assetId:String):IAsset {
			trace("(AssetLibSingelton.getAsset2)!")
			if(construida){
				return assetLib.getAsset(assetId)
			}else {
				return null
			}
		}
		public static function getAssetCopy2(assetId:String):IAsset {
			trace("(AssetLibSingelton.getAsset2)!")
			if(construida){
				return assetLib.getAssetCopy(assetId)
			}else {
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