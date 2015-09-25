/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 03/02/2011 21:50
*/
package es.robertoferrero.juegos.lib.escudoHumano.pantallas{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.juegos.assets.menus.eventos.EventoMenuJuego;
	import es.robertoferrero.juegos.assets.pantallas.IPantallaJuego;
	import es.robertoferrero.juegos.IJuego;
	import flash.display.MovieClip;
	//---------------------------
	// CLASSES del Package:
	public class Instrucciones extends MovieClip implements IPantallaJuego{
		// import es.robertoferrero.juegos.lib.escudoHumano.pantallas.Instrucciones
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		public const _pantallaId:String = "op_instrucciones"
		private var juego:IJuego
		private var mostrandose:Boolean = false
		//------------
		// CONSTRUCTORA:
		public function Instrucciones(){
			trace ("(Instrucciones.CONSTRUCTORA)!")
			this.visible = false
		}
		//------------
		// PUBLICOS:
		// Obligados por el interface:
		public function init(_juego:IJuego):void {
			trace ("(Instrucciones.init)!")
			juego = _juego
			juego.addEventListener(EventoMenuJuego.OPCION_SELECCIONADA, this.onOpcionSeleccionada)
			juego.registrarPantalla(this)
		}
		public function get pantallaId():String {
			return _pantallaId
		}
		// Getters:
		// Setters:
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		private function mostrar() {
			if (!mostrandose) {
				trace ("(Instrucciones.mostrar)!")
				mostrandose = true
				this.visible = true
			}
		}
		private function ocultar() {
			if (mostrandose) {
				trace ("(Instrucciones.ocultar)!")
				mostrandose = false
				this.visible = false
			}
		}
		//------------
		// EVENTOS:
		private function onOpcionSeleccionada(evento:EventoMenuJuego):void {
			if (evento.opcionId == pantallaId) {
				mostrar()
			}else {
				ocultar()
			}
		}
		
	}
	
}