/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 07/02/2011 19:14
* IMPORTANTE: Todas las clases del paquete com.ionewmedia que extienden MovieClip
*             vinculados a elementos de biblioteca requieren desactivar:
*             "Declaracion instancias de escenario automaticamente" en "Configuración de publicación" en (CS3).
* IMPORTAT: All classes inside the com.ionewmedia package that extends MovieClip and are linked to Library items
*             need the "Automatically declare stage instances" UNCHECKED in "Publish Settings" (CS3)
*/
package es.robertoferrero.framework.assets.sliders{
	//---------------------------
	// IMPORTS del Package:
	import flash.display.MovieClip;
	import flash.events.Event;
	//---------------------------
	// CLASSES del Package:
	public class SliderPlacer extends MovieClip implements ISlider{
		// import es.robertoferrero.framework.assets.sliders.SliderPlacer
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		public var asset:ISlider
		private var assetRef:MovieClip
		private var existeRef:Boolean = false
		//------------
		// CONSTRUCTORA:
		public function SliderPlacer(){
			// trace ("(SliderPlacer.CONSTRUCTORA)!")
			this.visible = false
		}
		//------------
		// PUBLICOS:
		// Obligados por el interface ISlider
		public function init(id:String, ratio:Number = 0, manejadorSize:Number = 30, size:Number = 150, propiedad:String = null):void {
			trace ("(SliderPlacer.init)!")
			if(existeRef){
				this.visible = true
				//--
				// Tomamos la info creada en tiempo de edicion y limpiamos
				var nuevoSize:Number = this.height
				this.scaleY = 1
				this.removeChildAt(0)
				//--
				asset.init(id, ratio, manejadorSize, nuevoSize, propiedad)
				this.addChild(asset as MovieClip)
			}else {
				trace("ATENCION: No se ha suministrado un assetRef mediante setAssetRef()")
			}
		}
		// Obligados por el interfaz IAsset:
		public function getCopy():Object {
			var copy:Object = new SliderBase() as Object
			return copy
		}
		public function get inicializado():Boolean {
			if (existeRef) {
				return asset.inicializado
			}else {
				return false
			}
		}
		//--------------
		public function setAssetRef(ref:MovieClip):void {
			existeRef = true
			assetRef = ref
			var sliderAsset:ISlider = assetRef as ISlider
			asset = sliderAsset.getCopy() as ISlider
		}
		public function setAssetCopy(ref:MovieClip):void {
			trace ("(SliderPlacer.setAssetCopy)!")
			existeRef = true
			asset = ref as ISlider
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
		//---------
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