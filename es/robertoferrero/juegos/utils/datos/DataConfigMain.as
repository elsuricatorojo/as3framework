/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 21/01/2011 12:49
* IMPORTANTE: Todas las clases del paquete com.ionewmedia que extienden MovieClip
*             vinculados a elementos de biblioteca requieren desactivar:
*             "Declaracion instancias de escenario automaticamente" en "Configuración de publicación" en (CS3).
* IMPORTAT: All classes inside the com.ionewmedia package that extends MovieClip and are linked to Library items
*             need the "Automatically declare stage instances" UNCHECKED in "Publish Settings" (CS3)
*/
package es.robertoferrero.juegos.utils.datos{
	//---------------------------
	// IMPORTS del Package:
	//---------------------------
	// CLASSES del Package:
	public class DataConfigMain{
		// import es.robertoferrero.juegos.utils.datos.DataConfigMain
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		public var hayPrecarga:Boolean = true
		public var hayFondo:Boolean = true
		public var hayIntro:Boolean = false
		public var config_xml:String = "data/config.xml"
		//------------
		// CONSTRUCTORA:
		public function DataConfigMain(){
			// trace ("(DataConfigMain.CONSTRUCTORA)!")
			
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