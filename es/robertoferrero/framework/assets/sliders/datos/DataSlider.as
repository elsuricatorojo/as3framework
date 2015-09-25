/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 07/02/2011 12:19
*/
package es.robertoferrero.framework.assets.sliders.datos{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.assets.sliders.ISlider;
	//---------------------------
	// CLASSES del Package:
	public class DataSlider{
		// import es.robertoferrero.framework.assets.sliders.datos.DataSlider
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		public var size:Number // Tamaño del slider
		public var posicion:Number // Posicion del manejador
		public var manejadorSize:Number // Tamaño del manejador
		public var slider:ISlider // Referencia del Slider asociado a estos datos
		public var rango:Number // 
		public var ratio:Number // 0 -> 1
		public var propiedad:String = null
		//------------
		// CONSTRUCTORA:
		public function DataSlider(){
			// trace ("(DataSlider.CONSTRUCTORA)!")
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