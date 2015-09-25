/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 16/02/2009 14:17
* IMPORTANTE: Todas las clases del paquete es.robertoferrero que extienden MovieClip
*             vinculados a elementos de biblioteca requieren desactivar:
*             "Declaracion instancias de escenario automaticamente" en "Configuración de publicación" en (CS3).
* IMPORTAT: All classes inside the es.robertoferrero package that extends MovieClip and are linked to Library items
*             need the "Automatically declare stage instances" UNCHECKED in "Publish Settings" (CS3)
*/
package es.robertoferrero.framework.geom{
	//---------------------------
	// IMPORTS del Package:
	import flash.geom.Point;
	import es.robertoferrero.framework.geom.utils.LineaUtils
	import es.robertoferrero.framework.geom.utils.DegreeUtils
	import es.robertoferrero.framework.geom.utils.GeomUtils
	//---------------------------
	// CLASSES del Package:
	public class Linea{
		// import es.robertoferrero.framework.geom.Linea
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		// Caso linea NO vertical: y=ax+b
		private var _a:Number = NaN
		private var _b:Number = NaN
		// Caso linea vertical: x=2
		private var _c:Number = NaN
		private var _angulo:Number
		public var existe:Boolean = true;
		//------------
		// CONSTRUCTORA:
		public function Linea(a:Number =NaN, b:Number=NaN, c:Number=NaN){
			// trace ("(Linea.CONSTRUCTORA)!")
			_a = a
			if (isNaN(b)) {
				b=0
			}
			_b = b
			_c = c
			//--
			eval_angulo();
		}
		//------------
		// PUBLICOS:
		public function get_y(valor_x:Number):Number {
			//
			var valor_y:Number;
			if (!isNaN(c)) {
				// Es vertical
				valor_y = NaN;
			} else {
				valor_y = (a*valor_x)+b;
			}
			return (valor_y);
		}
		public function get_x(valor_y:Number):Number {
			//
			var valor_x:Number = ((valor_y-b)/a);
			return (valor_x);
		}
		public function clone():Linea {
			var copia:Linea = new Linea(_a, _b, _c)
			return copia
		}
		public function pertenece(p1:Point):Boolean {
			var resultado:Boolean = LineaUtils.pertenece(this.clone(), p1)
			return resultado
		}
		public function toString():String {
			if (!isNaN(c)) {
				return ("(Linea): x = "+c+"  angulo:"+_angulo)
			}else {
				return ("(Linea): y = "+a+"x + "+b+"  angulo:"+_angulo)
			}
			
		}
		//-----------------
		// GETTERS:
		public function get a():Number {
			return (_a);
		}
		public function get b():Number {
			return (_b);
		}
		public function get c():Number {
			return (_c);
		}
		//-----------------
		// SETTERS:
		public function set a(valor:Number):void {
			_c = NaN;
			_a = valor;
			eval_angulo();
		}
		public function set b(valor:Number):void {
			_c = NaN;
			_b = valor;
			eval_angulo();
		}
		public function set c(valor:Number):void {
			_a = NaN;
			_b = NaN;
			_c = valor;
			eval_angulo();
		}
		
		public function get angulo():Number {
			eval_angulo()
			return _angulo;
		}
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		
		private function eval_angulo():void {
			// Escojemos 2 puntos y hayamos el angulo
			if (!isNaN(c)) {
				// Es vertical
				_angulo = 90;
			} else {
				var punto1:Point = new Point(-100, get_y( -100));
				var punto2:Point = new Point(100, get_y(100));
				//trace(punto1+"  "+punto2)
				_angulo = GeomUtils.angleOfLinePts(punto1, punto2);
			}
		}
		//------------
		// EVENTOS:
	}
}