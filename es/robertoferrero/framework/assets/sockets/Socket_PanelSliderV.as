/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 22/02/2011 11:21
*/
package es.robertoferrero.framework.assets.sockets{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.assets.paneles.IPanel;
	import es.robertoferrero.framework.assets.sliders.ISlider;
	import es.robertoferrero.framework.assets.paneles.eventos.EventoPanel;
	import es.robertoferrero.framework.assets.sliders.eventos.EventoSlider;
	//---------------------------
	// CLASSES del Package:
	public class Socket_PanelSliderV{
		// import es.robertoferrero.framework.assets.sockets.Socket_PanelSliderV
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		private var panel:IPanel
		private var sider:ISlider
		//------------
		// CONSTRUCTORA:
		public function Socket_PanelSliderV(panel:IPanel, slider:ISlider){
			trace ("(Socket_PanelSliderV.CONSTRUCTORA)!")
			this.panel = panel
			this.slider = slider
		}
		public function init():void {
			panel.addEventListener(EventoSlider
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