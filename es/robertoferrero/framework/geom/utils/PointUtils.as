/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 16/02/2009 12:52
* IMPORTANTE: Todas las clases del paquete es.robertoferrero que extienden MovieClip
*             vinculados a elementos de biblioteca requieren desactivar:
*             "Declaracion instancias de escenario automaticamente" en "Configuración de publicación" en (CS3).
* IMPORTAT: All classes inside the es.robertoferrero package that extends MovieClip and are linked to Library items
*             need the "Automatically declare stage instances" UNCHECKED in "Publish Settings" (CS3)
*/
package es.robertoferrero.framework.geom.utils{
	//---------------------------
	// IMPORTS del Package:
	import flash.geom.Point;
	import es.robertoferrero.framework.geom.utils.DegreeUtils
	//---------------------------
	// CLASSES del Package:
	public class PointUtils{
		// import es.robertoferrero.framework.geom.utils.PointUtils
		//--
		public static function interpolar(p1:Point, p2:Point, f:Number):Point {
			// f: 0->1
			return new Point(f*p1.x+(1-f)*p2.x, f*p1.y+(1-f)*p2.y);
		}
		public static function distancia(p1:Point, p2:Point):Number {
			var dx:Number = p2.x-p1.x;
			var dy:Number = p2.y-p1.y;
			return Math.sqrt(dx*dx+dy*dy);
		}
		public static function polar(len:Number, angleRad:Number):Point {
			return new Point(len*Math.cos(angleRad), len*Math.sin(angleRad));
		}
		public static function puntoMedio(p1:Point, p2:Point):Point {
			var pMedio:Point = new Point(((p1.x+p2.x)/2), ((p1.y+p2.y)/2));
			return pMedio;
		}	
		public static function angulo(p1:Point, p2:Point):Number {
			// Devuelve el angulo en grados.
			return DegreeUtils.atan2D(p2.y-p1.y, p2.x-p1.x);
		}
		public static function round(p1:Point):Point {
			// Redondea las coordenadas del punto.
			var nuevoPunto:Point = new Point(Math.round(p1.x), Math.round(p1.y))
			return nuevoPunto
		}
		public static function restar(p1:Point, p2:Point):Point {
			// Devuele un punto resta de p1-p2
			var nuevoPunto:Point = new Point((p1.x-p2.x), (p1.y-p2.y))
			return nuevoPunto
		}
	}
}