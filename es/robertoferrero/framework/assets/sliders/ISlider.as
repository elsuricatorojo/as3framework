/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 07/02/2011 20:25
*/
package es.robertoferrero.framework.assets.sliders {
	import es.robertoferrero.framework.assets.IAsset;
	//--
	public interface ISlider extends IAsset{
		function init(id:String, ratio:Number = 0, manejadorSize:Number = 30, size:Number = 150, propiedad:String = null):void
	}

}