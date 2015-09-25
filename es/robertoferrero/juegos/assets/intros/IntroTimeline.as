/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 24/01/2011 11:56
*/
package es.robertoferrero.juegos.assets.intros{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.juegos.IMainJuego;
	import es.robertoferrero.juegos.utils.eventos.EventoMainJuego;
	import flash.display.MovieClip;
	//---------------------------
	// CLASSES del Package:
	public class IntroTimeline extends MovieClip implements IIntroInicio{
		// import es.robertoferrero.juegos.assets.intros.IntroTimeline
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		// En el timeline:
		public var intro_mc:MovieClip
		//--
		private var main:IMainJuego
		//------------
		// CONSTRUCTORA:
		public function IntroTimeline(){
			trace ("(IntroTimeline.CONSTRUCTORA)!")
			this.visible = false
		}
		//------------
		// PUBLICOS:
		// Obligados por el inteface IIntroInicio:
		public function init(_main:IMainJuego):void {
			trace ("(IntroTimeline.init)!")
			main = _main
			main.addEventListener(EventoMainJuego.MAIN_INTRO_INICIAR, onIniciarIntro)
		}
		//-----------
		public function finIntro():void {
			trace ("(IntroTimeline.finIntro)!")
			var evento:EventoMainJuego = new EventoMainJuego(EventoMainJuego.MAIN_INTRO_FIN)
			this.dispatchEvent(evento)
			this.visible = false
		}
		// Getters:
		// Setters:
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		//------------
		// EVENTOS:
		private function onIniciarIntro(evento:EventoMainJuego):void {
			trace ("(IntroTimeline.onIniciarIntro)!")
			this.visible = true
			intro_mc.init(this)
		}
	}
}