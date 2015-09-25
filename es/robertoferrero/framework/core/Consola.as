/*
DOCUMENTACION:
* Roberto Ferrero - hola@robertoferrero.es
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 18/04/2013 8:33
*/
package es.robertoferrero.framework.core{
	//---------------------------
	// IMPORTS del Package:
	import flash.events.EventDispatcher;
	import es.robertoferrero.framework.eventos.EventoGenerico;
	//---------------------------
	// CLASSES del Package:
	public class Consola extends EventDispatcher{
		// import es.robertoferrero.framework.core.Consola
		//--------------------
		// DOCUMENTACION:
		//--------------------
		// PARAMETROS:
		private static var inst:Consola;
		private static var count:Number = 0;
		//--
		public var texto:String = ""
		public var hacerTraceNativo:Boolean = true
		//--------------------
		// CONSTRUCTORA:
		public function Consola(){
			trace("(Consola.CONSTRUCTORA)!")
			trazar("(Consola.CONSTRUCTORA)!")
			trazar("=======================")
		}
		public static function getInstance ():Consola{
			if (inst == null)	{
				inst = new Consola ();
			}
			++count;
			return inst;
		}
		//------------
		// PUBLICOS:
		public function trazar(lineaTexto:String, doActualizar:Boolean = true):void {
			//trace("(Consola.trazar)!")
			if(hacerTraceNativo){
				trace(lineaTexto)
			}
			//texto = lineaTexto + "\n" + texto
			texto = lineaTexto + "\n" + texto
			if (doActualizar) {
				actualizar()
			}
		}
		public function trazarObjeto(obj:Object, nombreObjeto:String = "") {
			//trace("(Consola.trazarObjeto)!")
			trazar("--------", false)
			if(nombreObjeto != ""){
				trazar("Objeto: " + nombreObjeto, false)
			}
			for (var item in obj) {
				trazar("     "+item+": "+obj[item]+"  typeOf: "+typeof (obj[item]), false);
			}
			trazar("--------", true)
		}
		public function actualizar():void {
			var data:Object = new Object()
			data.texto = texto
			var evento:EventoGenerico = new EventoGenerico("onActualizarConsola", data)
			dispatchEvent(evento)
		}
		//------------
		// PRIVADOS:
	}
}