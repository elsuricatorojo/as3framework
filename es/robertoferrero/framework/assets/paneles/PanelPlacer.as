/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 23/02/2011 10:37
*/
package es.robertoferrero.framework.assets.paneles{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.assets.sliders.ISlider;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	//---------------------------
	// CLASSES del Package:
	public class PanelPlacer extends MovieClip implements IPanel{
		// import es.robertoferrero.framework.assets.paneles.PanelPlacer
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		public var asset:IPanel
		private var assetRef:MovieClip
		private var existeRef:Boolean = false
		//------------
		// CONSTRUCTORA:
		public function PanelPlacer(){
			// trace ("(PanelPlacer.CONSTRUCTORA)!")
			this.visible = false
		}
		//------------
		// PUBLICOS:
		// Obligados por el interfaz IPanel:
		public function init(id:String, contenido:DisplayObject = null, sizeMsk:Rectangle = null, sizeContenido:Rectangle = null, posicion:Point = null):void {
			trace ("(PanelPlacer.init)!")
			if(existeRef){
				this.visible = true
				//--
				// Tomamos la info creada en tiempo de edicion y limpiamos
				var nuevoSizeMsk:Rectangle = new Rectangle(0, 0, this.width, this.height)
				this.scaleX = 1
				this.scaleY = 1
				this.removeChildAt(0)
				//--
				asset.init(id, contenido, nuevoSizeMsk, sizeContenido, posicion)
				this.addChild(asset as MovieClip)
			}else {
				trace("ATENCION: No se ha suministrado un assetRef mediante setAssetRef()")
			}
		}
		public function nuevoRatioX(ratio:Number):void {
			//trace ("(PanelPlacer.nuevoRatioX)!")
			asset.nuevoRatioX(ratio)			
		}
		public function nuevoRatioY(ratio:Number):void {
			//trace ("(PanelPlacer.nuevoRatioY)!")
			asset.nuevoRatioY(ratio)	
		}
		// Obligados por el interfaz IAsset:
		public function getCopy():Object {
			var copy:Object = new PanelPlacer() as Object
			return copy
		}
		public function get inicializado():Boolean {
			if (existeRef) {
				return asset.inicializado
			}else {
				return false
			}
		}
		//----------------------------------------------
		public function testScope(txt:String):void {
			trace ("(PanelPlacer.testScope) ---------------------- "+txt)
		}
		//----------------------------------------------
		public function setAssetRef(ref:MovieClip):void {
			existeRef = true
			assetRef = ref
			var panelAsset:IPanel = assetRef as IPanel
			asset = panelAsset.getCopy() as IPanel
		}
		public function setAssetCopy(ref:MovieClip):void {
			trace ("(PanelPlacer.setAssetCopy)!")
			existeRef = true
			asset = ref as IPanel
		}
		//----------
		// Sobre-escribimos los metodos basicos heredados de EventDispatcher para que actuen como puente
		// y apunten al asset en vez del placer
		public override function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
			asset.addEventListener(type, listener, useCapture, priority, useWeakReference)
		}
		public override function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {
			asset.removeEventListener(type, listener, useCapture)
		}
		public override function hasEventListener(type:String):Boolean {
			return asset.hasEventListener(type)
		}
		public override function dispatchEvent(event:Event):Boolean {
			return asset.dispatchEvent(event)
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