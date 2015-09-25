/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 21/01/2011 11:51
* IMPORTANTE: Todas las clases del paquete com.ionewmedia que extienden MovieClip
*             vinculados a elementos de biblioteca requieren desactivar:
*             "Declaracion instancias de escenario automaticamente" en "Configuración de publicación" en (CS3).
* IMPORTAT: All classes inside the com.ionewmedia package that extends MovieClip and are linked to Library items
*             need the "Automatically declare stage instances" UNCHECKED in "Publish Settings" (CS3)
*/
package es.robertoferrero.juegos.assets.fondos{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.juegos.IMainJuego;
	import flash.display.MovieClip;
	//---------------------------
	// CLASSES del Package:
	public class FondoInicio extends MovieClip implements IFondoInicio{
		// import es.robertoferrero.juegos.assets.fondos.FondoInicio
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		var main:IMainJuego
		//------------
		// CONSTRUCTORA:
		public function FondoInicio (){
			trace ("(FondoInicio.CONSTRUCTORA)!")
			
		}
		//------------
		// PUBLICOS:
		// Obligados por el interface IFondoInicio:
		public function init(_main:IMainJuego):void {
			main = _main
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