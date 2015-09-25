/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 19/01/2011 18:42
*/
package es.robertoferrero.juegos.assets.precargas{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.loaders.Buffer;
	import es.robertoferrero.framework.loaders.eventos.EventoCarga;
	import es.robertoferrero.juegos.IMainJuego;
	import es.robertoferrero.juegos.utils.eventos.EventoMainJuego;
	//--
	import flash.text.TextField;
	import flash.display.MovieClip;
	//---------------------------
	// CLASSES del Package:
	public class PrecargaDoble extends MovieClip implements IPrecargaInicio{
		// import es.robertoferrero.juegos.assets.precargas.PrecargaDoble
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		// Presentes en el timeline:
		public var barra1:MovieClip
		public var barra2:MovieClip
		public var msk:MovieClip
		public var base:MovieClip
		public var info_txt:TextField
		//--
		var main:IMainJuego
		var buffer1:Buffer
		var buffer2:Buffer
		var rangoX:Number
		var posIni1:Number
		var posIni2:Number
		//------------
		// CONSTRUCTORA:
		public function PrecargaDoble(){
			trace ("(PrecargaDoble.CONSTRUCTORA)!")
			posIni1 = barra1.x
			posIni2 = barra2.x
			//--
			info_txt.text = ""
			//--
			config() // En el timeline
		}
		//------------
		// PUBLICOS:
		// Requeridos en el interface IPrecargaInicio:
		public function init(_main:IMainJuego):void {
			trace ("(PrecargaDoble.init)!")
			main = _main
			main.addEventListener(EventoMainJuego.MAIN_CARGA_CONFIG_INICIO, onInicioCargaConfig)
			main.addEventListener(EventoMainJuego.MAIN_CARGA_CONFIG_FIN, onFinCargaConfig)
			main.addEventListener(EventoMainJuego.MAIN_CARGA_ASSETS_INICIO, onInicioCargaAssets)
			main.addEventListener(EventoMainJuego.MAIN_CARGA_ASSETS_FIN, onFinCargaAssets)
			//--
			buffer1 = main.get_cargadorInicial()
			buffer1.addEventListener(EventoCarga.PROGRESS_CARGA, onProgressInicioCarga)
			//buffer1.addEventListener(EventoCarga.TODO_CARGADO, onInicioCargado)
			//--
			buffer2 = main.get_cargadorAssets()
			buffer2.addEventListener(EventoCarga.PROGRESS_CARGA, onProgressAssetsCarga)
			//buffer2.addEventListener(EventoCarga.TODO_CARGADO, onAssetsCargado)
		}
		// Getters:
		// Setters:
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		private function ocultar() {
			this.visible = false
		}
		//------------
		// EVENTOS:
		private function onProgressInicioCarga (evento:EventoCarga):void {
			//trace ("(PrecargaDoble.onProgressInicioCarga): "+evento.data.porcentaje)
			var porcentaje:Number = evento.data.porcentaje
			var posX:Number = posIni1 + (rangoX * (porcentaje / 100))
			barra1.x = posX
		}
		private function onProgressAssetsCarga (evento:EventoCarga):void {
			var porcentaje:Number = evento.data.porcentaje
			var posX:Number = posIni2 + (rangoX * (porcentaje / 100))
			barra2.x = posX
		}
		private function onInicioCargaConfig (evento:EventoMainJuego):void {
			trace ("(PrecargaDoble.onInicioCargaConfig)!")
			info_txt.text = "cargando..."
		}
		private function onFinCargaConfig (evento:EventoMainJuego):void {
			trace ("(PrecargaDoble.onFinCargaConfig)!")
		}
		private function onInicioCargaAssets (evento:EventoMainJuego):void {
			trace ("(PrecargaDoble.onInicioCargaAssets)!")
			info_txt.text = "cargando componentes..."
		}
		private function onFinCargaAssets (evento:EventoMainJuego):void {
			trace ("(PrecargaDoble.onFinCargaAssets)!")
			ocultar()
		}
	}
}