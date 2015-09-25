/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 14/01/2011 18:18
* IMPORTANTE: Todas las clases del paquete com.ionewmedia que extienden MovieClip
*             vinculados a elementos de biblioteca requieren desactivar:
*             "Declaracion instancias de escenario automaticamente" en "Configuración de publicación" en (CS3).
* IMPORTAT: All classes inside the com.ionewmedia package that extends MovieClip and are linked to Library items
*             need the "Automatically declare stage instances" UNCHECKED in "Publish Settings" (CS3)
*/
package es.robertoferrero.juegos{
	//---------------------------
	// IMPORTS del Package:
	
	import es.robertoferrero.juegos.assets.intros.IntroTimeline;
	import es.robertoferrero.juegos.assets.menus.IMenuJuego;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	//--
	import es.robertoferrero.juegos.assets.precargas.IPrecargaInicio;
	import es.robertoferrero.juegos.assets.fondos.IFondoInicio;
	import es.robertoferrero.juegos.assets.intros.IIntroInicio;
	import es.robertoferrero.juegos.utils.datos.DataConfigMain
	import es.robertoferrero.juegos.utils.datos.TiposAssets;
	import es.robertoferrero.juegos.utils.lib.LibParams;
	import es.robertoferrero.juegos.utils.lib.LibPaths;
	import es.robertoferrero.juegos.utils.lib.LibAssets;
	import es.robertoferrero.juegos.utils.eventos.EventoMainJuego;
	//--
	import es.robertoferrero.framework.data.Datos;
	import es.robertoferrero.framework.loaders.Buffer
	import es.robertoferrero.framework.loaders.Cargador;
	import es.robertoferrero.framework.loaders.CargadorMain;
	import es.robertoferrero.framework.loaders.CargadorDisplayObj;
	import es.robertoferrero.framework.loaders.CargadorXML;
	import es.robertoferrero.framework.loaders.eventos.EventoCarga;
	//---------------------------
	// CLASSES del Package:
	public class MainJuego extends MovieClip implements IMainJuego{
		// import es.robertoferrero.juegos.MainJuego
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		// En el timeline:
		public var precarga:IPrecargaInicio
		public var fondo:IFondoInicio
		//--
		public var juego:IJuego
		public var intro:IIntroInicio
		//--
		private var params:LibParams
		private var paths:LibPaths
		private var assets:LibAssets
		private var cargadorInicial:Buffer
		private var cargadorAssets:Buffer
		private var mainConfigXML:XML
		//--
		private var hayPrecarga:Boolean
		private var hayFondo:Boolean
		private var hayIntro:Boolean
		private var config_xml:String
		//------------
		// CONSTRUCTORA:
		public function MainJuego(){
			trace ("(MainJuegos.CONSTRUCTORA)!")
			cargadorInicial = new Buffer("cargador_inicial")
			cargadorAssets = new Buffer("cargador_assets")
			assets = new LibAssets(this)
			params = new LibParams(this)
			paths = new LibPaths(this)
		}
		public function init(_juego:IJuego, dataConfig:DataConfigMain):void {
			trace ("(MainJuegos.init)!")
			juego = _juego
			//--
			hayPrecarga = dataConfig.hayPrecarga
			hayFondo = dataConfig.hayFondo
			hayIntro = dataConfig.hayIntro
			config_xml = dataConfig.config_xml
			//--
			trace("   config_xml: " + config_xml)
			trace("   hayPrecarga: " + hayPrecarga)
			trace("   hayFondo: " + hayFondo)
			trace("   hayIntro: " + hayIntro)
			//--
			init_cargas()
			//--
			precarga.init(this)
			fondo.init(this)
			//--
			var evento:EventoMainJuego = new EventoMainJuego(EventoMainJuego.MAIN_INIT)
			this.dispatchEvent(evento)
			//--
			iniciarCargaInicial()
			
		}
		//------------
		// PUBLICOS:
		// Obligados por el interfaz IMainJuego
		public function get_cargadorInicial():Buffer {
			return cargadorInicial
		}
		public function get_cargadorAssets():Buffer {
			return cargadorAssets
		}
		public function get_params():LibParams {
			return params
		}
		public function get_paths():LibPaths{
			return paths
		}
		public function get_assets():LibAssets {
			return assets
		}
		public function registrarAsset(ref:Object, assetId:String):void {
			trace ("(MainJuegos.registrarAsset): "+assetId)
			if (assetId == "introInicio") {
				ref = ref as IIntroInicio
				var intro:IIntroInicio = ref as IIntroInicio
				
			}
		}
		public function get_mainConfigXML():XML {
			return mainConfigXML
		}
		//-------
		
		// Getters:
		// Setters:
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		private function init_cargas():void {
			var carga1:CargadorMain = new CargadorMain(this, "root_swf", cargadorInicial, 10)
			cargadorInicial.nuevaCarga(carga1, 9)
			//--
			var carga2:CargadorXML = new CargadorXML(config_xml, "config_xml", cargadorInicial)
			cargadorInicial.nuevaCarga(carga2, 1)
			//--
			cargadorInicial.addEventListener(EventoCarga.EXITO_CARGA, onExitoCargaMain)
			cargadorInicial.addEventListener(EventoCarga.TODO_CARGADO, onTodoCargadoMain)
		}
		private function iniciarCargaInicial():void {
			var evento:EventoMainJuego = new EventoMainJuego(EventoMainJuego.MAIN_CARGA_CONFIG_INICIO)
			this.dispatchEvent(evento)
			//--
			cargadorInicial.init()
		}
		private function iniciarCargaAssets():void {
			var evento:EventoMainJuego = new EventoMainJuego(EventoMainJuego.MAIN_CARGA_ASSETS_INICIO)
			this.dispatchEvent(evento)
			//--
			cargadorAssets.init()
		}
		private function iniciarIntro():void {
			var eventoMain:EventoMainJuego = new EventoMainJuego(EventoMainJuego.MAIN_INTRO_INICIAR)
			this.dispatchEvent(eventoMain)
		}
		private function iniciarJuego():void {
			var eventoMain:EventoMainJuego = new EventoMainJuego(EventoMainJuego.MAIN_JUEGO_INICIAR)
			this.dispatchEvent(eventoMain)
		}
		//------------
		// EVENTOS:
		private function onExitoCargaMain(evento:EventoCarga) {
			trace ("(MainJuego.onExitoCargaMain): "+evento.cargaId)
			if (evento.cargaId=="root_swf") {
				cargadorInicial.resumir()
			}else if (evento.cargaId == "config_xml") {
				mainConfigXML = evento.data as XML
				//--
				params.setXML(evento.data as XML)
				paths.setXML(evento.data as XML)
				//--
				assets.setXML(evento.data as XML, true)
				assets.registrarCargas(cargadorAssets)
				//--
				cargadorAssets.addEventListener(EventoCarga.EXITO_CARGA, onExitoCargaAsset)
				cargadorAssets.addEventListener(EventoCarga.TODO_CARGADO, onTodoCargadoAsset)
				//--
				cargadorInicial.resumir()
			}
		}
		private function onTodoCargadoMain(evento:EventoCarga) {
			trace ("(MainJuego.onTodoCargadoMain): " + evento.cargaId)
			//--
			var eventoMain:EventoMainJuego = new EventoMainJuego(EventoMainJuego.MAIN_CARGA_CONFIG_FIN)
			this.dispatchEvent(eventoMain)
			//--
			iniciarCargaAssets()
		}
		private function onExitoCargaAsset(evento:EventoCarga) {
			trace ("(MainJuego.onExitoCargaAsset): " + evento.cargaId)
			//--
			var assetId:String = evento.cargaId
			var tipoAsset:String = assets.getTipoAsset(assetId)
			var ref:Object
			switch(tipoAsset) {
				case TiposAssets.TIPO_INTRO:
					ref = evento.data.loader.content as Object
					//var refIntro:IIntroInicio = ref as IIntroInicio
					//refIntro.addEventListener(EventoMainJuego.MAIN_INTRO_FIN, onFinIntro)
					//this.addChild(refIntro as MovieClip)
					//refIntro.init(this)
					break;
				case TiposAssets.TIPO_MENU:
					ref = evento.data.loader.content as Object
					var refMenu:IMenuJuego = ref as IMenuJuego
					refMenu.init(this)
					break;
				case TiposAssets.TIPO_IMG:
					ref = evento.data.loader.content as Object
					break;
				case TiposAssets.TIPO_SWF:
					ref = evento.data.loader.content as Object
					break;
				case TiposAssets.TIPO_XML:
					ref = evento.data as Object
					break;
				case TiposAssets.TIPO_MP3:
					ref = evento.data.loader as Object
					break;
			}
			assets.setAssetRef(assetId, ref)
			//--
			cargadorAssets.resumir()
		}
		private function onTodoCargadoAsset(evento:EventoCarga) {
			trace ("(MainJuego.onTodoCargadoAsset)!")
			//--
			var eventoMain:EventoMainJuego = new EventoMainJuego(EventoMainJuego.MAIN_CARGA_ASSETS_FIN)
			this.dispatchEvent(eventoMain)
			//--
			this.addChild(juego as MovieClip)
			juego.init(this)
			//juego["testScope"]("(MainJuego)")
			//--
			if (hayIntro) {
				var refIntro:IIntroInicio = assets.getAssetRef("INTRO") as IIntroInicio
				refIntro.addEventListener(EventoMainJuego.MAIN_INTRO_FIN, onFinIntro)
				this.addChild(refIntro as MovieClip)
				refIntro.init(this)
			}
			//--
			if (hayIntro) {
				iniciarIntro()
			}else {
				iniciarJuego()
			}
		}
		// INTRO:
		private function onFinIntro(evento:EventoMainJuego):void {
			trace ("(MainJuego.onFinIntro)!")
			var eventoMain:EventoMainJuego = new EventoMainJuego(EventoMainJuego.MAIN_INTRO_FIN)
			this.dispatchEvent(eventoMain)
			//--
			iniciarJuego()
		}
	}
}