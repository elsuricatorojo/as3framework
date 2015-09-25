/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 08/02/2011 12:40
*/
package es.robertoferrero.framework.assets.paneles {
	import es.robertoferrero.framework.assets.IAsset;
	import es.robertoferrero.framework.assets.paneles.datos.TiposRefPoint;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	//--
	public interface IPanel extends IAsset{
		function init(id:String, contenido:DisplayObject = null, sizeMsk:Rectangle = null, sizeContenido:Rectangle = null, posicion:Point = null):void
		function nuevoRatioX(ratio:Number):void
		function nuevoRatioY(ratio:Number):void
	}

}