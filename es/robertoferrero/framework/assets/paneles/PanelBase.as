/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 08/02/2011 13:03
* IMPORTANTE: Todas las clases del paquete com.ionewmedia que extienden MovieClip
*             vinculados a elementos de biblioteca requieren desactivar:
*             "Declaracion instancias de escenario automaticamente" en "Configuración de publicación" en (CS3).
* IMPORTAT: All classes inside the com.ionewmedia package that extends MovieClip and are linked to Library items
*             need the "Automatically declare stage instances" UNCHECKED in "Publish Settings" (CS3)
*/
package es.robertoferrero.framework.assets.paneles{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.assets.paneles.datos.DataPanel;
	import es.robertoferrero.framework.assets.paneles.datos.TiposRefPoint;
	import es.robertoferrero.framework.assets.paneles.eventos.EventoPanel;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import fl.controls.Slider
	import fl.events.ComponentEvent
	import flash.events.MouseEvent 
	//---------------------------
	// CLASSES del Package:
	public class PanelBase extends MovieClip implements IPanel{
		// import es.robertoferrero.framework.assets.paneles.PanelBase
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		// En el timeline:
		public var msk_mc:MovieClip
		public var contenido_mc:MovieClip
		public var testSliderX:Slider
		//--
		// Defaults:
		public var forzarSizeContenidos:Boolean = true // Indica si se toman las dimensiones del contenido interrogadas directamente
		public var defaultRefPoint:String = TiposRefPoint.UP_LEFT // Determina donde está el punto de referencia del contenido.
		public var defaultPosicion:Point = new Point(0,0)
		public var defaultSizeMsk:Rectangle = new Rectangle(0, 0, 300, 200)
		public var defaultSizeContenido:Rectangle = new Rectangle(0, 0, 600, 400)
		//--
		private var _inicializado:Boolean = false
		private var modoAutonomo:Boolean
		private var contenido:DisplayObject = null
		private var existeContenido:Boolean = false
		//------------
		// CONSTRUCTORA:
		public function PanelBase(){
			trace ("(PanelBase.CONSTRUCTORA)!")
			this.visible = false
			if (this.parent == this.stage && this.parent!=null) {
				trace("    PanelBase en modo AUTONOMO!")
				// MODO AUTONOMO
				modoAutonomo = true
				init("panel_test")
				//testSliderX.addEventListener(ComponentEvent.move, onSliderXMove)
				testSliderX.addEventListener(MouseEvent.MOUSE_MOVE, onSliderXMove)
			}else {
				trace("    PanelBase en modo INTEGRADO!")
				// MODO INTEGRADO
				modoAutonomo = false
			}
		}
		//------------
		// PUBLICOS:
		// Obligados por el interfce IAsset
		public function getCopy():Object {
			var copy:Object = new PanelBase() as Object
			return copy
		}
		public function get inicializado():Boolean {
			return _inicializado
		}
		// Obligados por el interfce IPanel
		public function init(id:String, contenido:DisplayObject = null, sizeMsk:Rectangle = null, sizeContenido:Rectangle = null, posicion:Point = null):void {
			trace ("(PanelBase.init)!")
			this.visible = true
			this._inicializado = true
			//---
			// Filtramos defaults:
			if (sizeMsk!=null) {
				defaultSizeMsk = sizeMsk
			}
			if (sizeContenido != null) {
				defaultSizeContenido = sizeContenido
			}
			if (posicion != null) {
				defaultPosicion = posicion
			}
			//---
			// Inyectamos el contenido de haberlo...
			if (contenido != null) {
				this.contenido = contenido
				existeContenido = true
				contenido_mc.addChild(contenido)
				//--
				if (defaultRefPoint == TiposRefPoint.UP_LEFT) {
					// Nada.
				}else if (defaultRefPoint == TiposRefPoint.CENTER) {
					// Reposicinamos contenido dentro de contenido_mc.
					contenido.x = contenido.width/2
					contenido.y = contenido.height/2
				}else {
					// No contemplado.
				}
			}
			// Pintamos estado inicial:
			var dataInicial:DataPanel = new DataPanel()
			dataInicial.sizeMsk = defaultSizeMsk
			dataInicial.sizeContenido = defaultSizeContenido
			dataInicial.posicion = defaultPosicion
			pintarEstado(dataInicial)
			// Emitimos evento inicial:
			var dataEvento:DataPanel = getData()
			var evento:EventoPanel = new EventoPanel(EventoPanel.INICIALIZADO, dataEvento)
			this.dispatchEvent(evento)
		}
		//--
		public function nuevoRatioX(ratio:Number):void {
			//trace ("(PanelBase.nuevoRatioX)!")
			var dataPanel:DataPanel = getData()
			var posX:Number = -(dataPanel.rangoX * ratio)
			dataPanel.posicion.x = posX
			pintarEstado(dataPanel)
			
		}
		public function nuevoRatioY(ratio:Number):void {
			//trace ("(PanelBase.nuevoRatioX)!")
			var dataPanel:DataPanel = getData()
			var posY:Number = -(dataPanel.rangoY * ratio)
			dataPanel.posicion.y = posY
			pintarEstado(dataPanel)
			
		}
		//----------------------
		public function testScope(txt:String):void {
			trace ("(PanelBase.testScope) ---------------------- "+txt)
		}
		// Getters:
		public function getData():DataPanel {
			var dataPanel:DataPanel = new DataPanel()
			dataPanel.sizeMsk = new Rectangle(0, 0, msk_mc.width, msk_mc.height)
			if(forzarSizeContenidos){
				dataPanel.sizeContenido = new Rectangle(0, 0, contenido_mc["fondo_mc"].width, contenido_mc["fondo_mc"].height)
			}else {
				dataPanel.sizeContenido = new Rectangle(0, 0, contenido.width, contenido.height)
			}
			dataPanel.posicion = new Point(contenido_mc.x, contenido_mc.y)
			return dataPanel
		}
		// Setters:
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		private function pintarEstado(dataPanel:DataPanel):void {
			msk_mc.width = dataPanel.sizeMsk.width
			msk_mc.height = dataPanel.sizeMsk.height
			if (forzarSizeContenidos) {
				contenido_mc["fondo_mc"].width = dataPanel.sizeContenido.width
				contenido_mc["fondo_mc"].height = dataPanel.sizeContenido.height
			}
			contenido_mc.x = dataPanel.posicion.x
			contenido_mc.y = dataPanel.posicion.y
			//--
			var evento:EventoPanel = new EventoPanel(EventoPanel.ACTUALIZADO, dataPanel)
			this.dispatchEvent(evento)
		}
		//------------
		// EVENTOS:
		private function onSliderXMove(evento:MouseEvent) {
			trace ("(PanelBase.onSliderXMove)!")
		}
	}
}