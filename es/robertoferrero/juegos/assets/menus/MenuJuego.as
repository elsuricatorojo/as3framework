/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 25/01/2011 18:23
*/
package es.robertoferrero.juegos.assets.menus{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.loaders.CargadorXML;
	import es.robertoferrero.framework.loaders.eventos.EventoCarga;
	import es.robertoferrero.juegos.assets.menus.eventos.EventoMenuJuego;
	//--
	import es.robertoferrero.juegos.assets.menus.datos.DataOpcionMenu
	import es.robertoferrero.juegos.assets.menus.xml.XMLParser_Menu;
	import es.robertoferrero.juegos.IMainJuego;
	//--
	import flash.display.MovieClip;
	//---------------------------
	// CLASSES del Package:
	public class MenuJuego extends MovieClip implements IMenuJuego{
		// import es.robertoferrero.juegos.assets.menus.MenuJuego
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		// En el timeline:
		public var menu_mc:MovieClip
		//--
		public var test_xml:String
		//--
		private var main:IMainJuego
		private var opciones:DataOpcionMenu
		private var opcionSel:String = null
		private var modoAutonomo:Boolean = true
		//------------
		// CONSTRUCTORA:
		public function MenuJuego(){
			trace ("(MenuJuego.CONSTRUCTORA)!")
			trace("   parent: " + this.parent)
			trace("   stage: " + this.stage)
			config()// En el timeline
			if (this.parent == this.stage && this.parent!=null) {
				trace("    MenuJuego en modo AUTONOMO!")
				// MODO AUTONOMO
				modoAutonomo = true
				cargarMenuXML()
			}else {
				trace("    MenuJuego en modo INTEGRADO!")
				modoAutonomo = false
				// MODO INTEGRADO
			}
		}
		//------------
		// PUBLICOS:
		// Obligados por el interface IMenuJuego
		public function init(_main:IMainJuego):void {
			trace ("(MenuJuego.init)!")
			main = _main
			//--
			if (!modoAutonomo) {
				var parser:XMLParser_Menu = new XMLParser_Menu("menu")
				parser.setXML(main.get_mainConfigXML())
				opciones = parser.getDataMenu()
			}
			//--
			menu_mc.init(this)
			//--
			var evento:EventoMenuJuego = new EventoMenuJuego(EventoMenuJuego.MENU_INIT, opcionSel)
			this.dispatchEvent(evento)
		}
		public function getOpciones():DataOpcionMenu {
			return opciones
		}
		public function getOpcionSel():String {
			return opcionSel
		}
		public function registrarOpcion(opcion:DataOpcionMenu, mcRef:MovieClip):void {
			mcRef.addEventListener(EventoMenuJuego.OPCION_SELECCIONADA, this.onOpcionSeleccionada)
		}
		// Getters:
		// Setters:
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		private function cargarMenuXML():void {
			trace ("(MenuJuego.cargarMenuXML)!")
			// Solo en modo autonomo:
			var cargador:CargadorXML = new CargadorXML(test_xml, "menu_xml")
			cargador.addEventListener(EventoCarga.EXITO_CARGA, onExitoCargaMenuXML)
			cargador.init()
		}
		//------------
		// EVENTOS:
		private function onExitoCargaMenuXML(evento:EventoCarga):void {
			trace ("(MenuJuego.onExitoCargaMenuXML)!")
			var parser:XMLParser_Menu = new XMLParser_Menu("menu")
			parser.setXML(evento.data as XML)
			opciones = parser.getDataMenu()
			//--
			init(null)
		}
		//---
		private function onOpcionSeleccionada(evento:EventoMenuJuego):void {
			trace ("(MenuJuego.onOpcionSeleccionada) opcionId: "+evento.opcionId)
			var evento2:EventoMenuJuego
			if (opcionSel != evento.opcionId ) {
				opcionSel = evento.opcionId
				evento2 = new EventoMenuJuego(EventoMenuJuego.OPCION_SELECCIONADA, opcionSel)
				this.dispatchEvent(evento2)
			}
		}
	}
}