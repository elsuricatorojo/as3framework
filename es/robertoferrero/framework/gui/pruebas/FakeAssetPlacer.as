/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 07/02/2011 10:43
* IMPORTANTE: Todas las clases del paquete com.ionewmedia que extienden MovieClip
*             vinculados a elementos de biblioteca requieren desactivar:
*             "Declaracion instancias de escenario automaticamente" en "Configuración de publicación" en (CS3).
* IMPORTAT: All classes inside the com.ionewmedia package that extends MovieClip and are linked to Library items
*             need the "Automatically declare stage instances" UNCHECKED in "Publish Settings" (CS3)
*/
package es.robertoferrero.framework.gui.pruebas{
	import es.robertoferrero.juegos.utils.lib.LibAssets;
	import flash.display.MovieClip;
	//---------------------------
	// IMPORTS del Package:
	//---------------------------
	// CLASSES del Package:
	public class FakeAssetPlacer extends MovieClip{
		// import es.robertoferrero.framework.gui.pruebas.FakeAssetPlacer
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		private var assetId:String
		private var assets:LibAssets
		private var alto:Number
		//------------
		// CONSTRUCTORA:
		public function FakeAssetPlacer (){
			trace ("(FakeAssetPlacer.CONSTRUCTORA)!")
			this.visible = false
			alto = this.height
			this.graphics.clear()
			this.scaleY = 1
			trace("   alto:"+alto)
		}
		public function init(_assetId:String, _assets:LibAssets) {
			trace ("(FakeAssetPlacer.init): " + _assetId)
			this.visible = true
			assetId = _assetId
			assets = _assets
			var asset_mc:MovieClip = assets.getAssetRef(_assetId) as MovieClip
			var asset:FakeAsset = asset_mc as FakeAsset
			var assetCopy:FakeAsset = asset.getCopy()
			assetCopy.testScope("(FakeAssetPlacer)")
			assetCopy.init(alto)
			this.addChild(assetCopy)
			
		}
		//------------
		// PUBLICOS:
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