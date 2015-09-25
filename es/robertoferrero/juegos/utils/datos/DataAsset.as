/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 18/01/2011 18:17
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
	public class DataAsset{
		// import es.robertoferrero.juegos.utils.datos.DataAsset
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		public var itemId:String
		public var url:String
		public var tipo:String // Una constante de TiposAssets
		public var peso:Number
		public var ref:Object
		public var refAsignada:Boolean = false
		//------------
		// CONSTRUCTORA:
		public function DataAsset(_itemId:String, _url:String, _tipo:String, _peso:Number = 1 ) {
			// trace ("(DataAsset.CONSTRUCTORA)!")
			itemId = _itemId
			url = _url
			tipo = _tipo
			peso = _peso
		}
		//------------
		// PUBLICOS:
		public function setRef(obj:Object):void {
			ref = obj
			refAsignada = true
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