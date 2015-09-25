/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 16/02/2009 14:14
* IMPORTANTE: Todas las clases del paquete es.robertoferrero que extienden MovieClip
*             vinculados a elementos de biblioteca requieren desactivar:
*             "Declaracion instancias de escenario automaticamente" en "Configuración de publicación" en (CS3).
* IMPORTAT: All classes inside the es.robertoferrero package that extends MovieClip and are linked to Library items
*             need the "Automatically declare stage instances" UNCHECKED in "Publish Settings" (CS3)
*/
package es.robertoferrero.framework.geom{
	import flash.geom.Point;
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.geom.utils.LineaUtils
	import es.robertoferrero.framework.geom.utils.PointUtils
	//---------------------------
	// CLASSES del Package:
	public class Segmento{
		// import es.robertoferrero.framework.geom.Segmento
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		private var _p1:Point
		private var _p2:Point
		//------------
		// CONSTRUCTORA:
		public function Segmento(p1:Point, p2:Point){
			// trace ("(Segmento.CONSTRUCTORA)!")
			_p1 = p1
			_p2 = p2
		}
		//------------
		// PUBLICOS:
		public function get componenteX():Number {
			return (_p2.x-_p1.x)
		}
		public function get componenteY():Number {
			return (_p2.y-_p1.y)
		}
		public function clone():Segmento {
			var nuevoClonico:Segmento = new Segmento(p1.clone(), p2.clone())
			return nuevoClonico
		}
		public function interpolar(f:Number):Point {
			// dado un f: 0->1 devuelve un punto perteneciente a la linea
			return new Point((f*_p1.x+(1-f)*_p2.x), (f*_p1.y+(1-f)*_p2.y));
		}
		public function puntoMedio():Point {
			return PointUtils.puntoMedio(_p1, _p2)
		}
		public function toString():String {
			return ("(Segmento): "+_p1+","+_p2+"  length:"+length+"  angulo:"+this.angulo)
		}
		// Getters:
		public function get p1():Point {
			return _p1;
		}
		public function get p2():Point {
			return _p2;
		}
		public function get angulo():Number {
			var lineaTemp:Linea = LineaUtils.getLine(_p1, _p2);
			return lineaTemp.angulo;
		}
		public function get linea():Linea {
			var lineaTemp:Linea = LineaUtils.getLine(_p1, _p2);
			return lineaTemp;
		}
		public function get length():Number {
			var dx:Number = _p2.x-_p1.x;
			var dy:Number = _p2.y-_p1.y;
			return Math.sqrt(dx*dx+dy*dy);
		}
		// Setters:
		public function set p1(valor:Point) {
			_p1 = valor;
		}
		public function set p2(valor:Point) {
			_p2 = valor;
		}
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		//------------
		// EVENTOS:
		
	}
	
}