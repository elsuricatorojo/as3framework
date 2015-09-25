/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 17/04/2009 10:17
* 
* Devuelve un valor autonumerico que se autoincrementa en 1 cada vez que se llama.
* Tiene acceso statico
*/
package es.robertoferrero.framework.utils{
	//---------------------------
	// IMPORTS del Package:
	//---------------------------
	// CLASSES del Package:
	public class Autonumerico{
		// import es.robertoferrero.framework.utils.Autonumerico
		//------------
		// DOCUMENTACION:
		static private var contador:Number = -1
		//------------
		// PARAMETROS:
		//------------
		// CONSTRUCTORA:
		public function Autonumerico(){
			// trace ("(Autonumerico.CONSTRUCTORA)!")
			
		}
		//------------
		// PUBLICOS:
		static public function get():Number {
			contador++
			return contador
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