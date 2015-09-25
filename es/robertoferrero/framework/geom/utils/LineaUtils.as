/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 16/02/2009 14:18
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
	import es.robertoferrero.framework.geom.Linea
	import es.robertoferrero.framework.utils.NumberUtils
	//---------------------------
	// CLASSES del Package:
	public class LineaUtils{
		// import es.robertoferrero.framework.geom.utils.LineaUtils
		public static function getLine(p0:Point, p1:Point):Linea {
			// Pasamos 2 puntos p0 y p1 pertenecientes a la linea
			// Devuelve un objeto con la info para crear una función que determine la línea.
			// Hay 2 casos:
			//    1) La linea es vertical. Se pasa el parametro "c" que actua como constante.
			//    2) La linea no es vertical. Pasamos "a" y "b" para definir la linea mediante
			//       la funcion "y = a*x + b"
			var linea:Linea = new Linea();
			var x0 = p0.x;
			var y0 = p0.y;
			var x1 = p1.x;
			var y1 = p1.y;
			if (x0 == x1) {
				if (y0 == y1) {
					// P0 and P1 are same point, return null
					linea.existe = false;
				} else {
					// Otherwise, the line is a vertical line
					linea.c= x0;
				}
			} else {
				linea.a = (y0-y1)/(x0-x1);
				linea.b = y0-(linea.a*x0);
			}
			// returns the line object
			return linea;
		}
		public static function getLine2(p0:Point, vector:Object):Linea {
			// Pasamos un punto de la linea y un vector de direccion
			// El vector dirección se define con "x" e "y"
			// Devuelve un objeto con la info para crear una función que determine la línea.
			// Hay 2 casos:
			//    1) La linea es vertical. Se pasa el parametro "c" que actua como constante.
			//    2) La linea no es vertical. Pasamos "a" y "b" para definir la linea mediante
			//       la funcion "y = a*x + b"
			var linea:Linea = new Linea();
			var x0 = p0.x;
			var vx0 = vector.x;
			if (vx0 == 0) {
				// the line is vertical
				linea.c = x0;
			} else {
				linea.a = vector.y/vx0;
				linea.b = p0.y-(linea.a*x0);
			}
			// returns the line object
			//trace(linea.toString());
			return linea;
		}
		public static function puntoInterseccion(linea0:Linea, linea1:Linea):Point {
			// Devuelve un Point el cual es la intersección de 2 Lineas
			// Si las lineas son paralelas devuelve null
			// Make sure both lines exists
			var interseccion:Point 
			if (!linea0.existe || !linea1.existe) {
				interseccion = null;
			}else{
				var a0:Number = linea0.a;
				var b0:Number = linea0.b;
				var c0:Number = linea0.c;
				var a1:Number = linea1.a;
				var b1:Number = linea1.b;
				var c1:Number = linea1.c;
				// Comprobamos si ambas lineas son verticales
				if (!evalEsVertical(linea0) && !evalEsVertical(linea1)) {
					// Las 2 No son verticales.
					if (a0 == a1) {
						//trace("Las 2 lineas son paralelas (pero no verticales). No interseccionan")
						interseccion = null
					}else{
						//trace("Las 2 lineas no son paralelas. Hayamos un punto x comun.")     
						var xComun:Number = (b1 - b0) / (a0 - a1);
						interseccion = new Point(xComun, (a0 * xComun + b0));
					}
				} else {
					if(evalEsVertical(linea0)){
						if (evalEsVertical(linea1)) {
							//trace("Las 2 lineas son verticales. No interseccionan.")
							interseccion = null
						} else {
							//trace("La primera linea es vertical pero la segunda no. Hayamos su puto de interseccion.")
							interseccion = new Point(c0, (a1*c0+b1));
						}
					} else if (evalEsVertical(linea1)) {
						//trace("La segunda linea es vertical pero la primera no. Hayamos su puto de interseccion.")
						interseccion = new Point(c1, (a0*c1+b0));
					}
				}
			}
			return interseccion;
		}
		static public function pertenece(linea:Linea, p1:Point, precision:int=6):Boolean {
			// El parametro precision indica hasta que numero de decimales se va a realizar la comprobacion
			//trace("linea: " + linea)
			//trace("p1: "+p1)
			var pertenece:Boolean = false
			var valor_x1:Number 
			var valor_x2:Number
			if (evalEsVertical(linea)) {
				valor_x1 = NumberUtils.aproximacion(linea.c, precision)
				valor_x2 = NumberUtils.aproximacion(p1.x, precision)
				if (valor_x1==valor_x2) {
					pertenece=true
				}else {
					pertenece=false
				}
			}else if (evalEsHorizontal(linea)) {
				valor_x1 = NumberUtils.aproximacion(linea.b, precision)
				valor_x2 = NumberUtils.aproximacion(p1.y, precision)
				if (valor_x1==valor_x2) {
					pertenece=true
				}else {
					pertenece=false
				}
			}else {
				valor_x1 = NumberUtils.aproximacion(linea.get_x(p1.y), precision)
				valor_x2 = NumberUtils.aproximacion(p1.x, precision)
				if (valor_x1==valor_x2) {
					pertenece=true
				}else {
					pertenece=false
				}
			}
			return pertenece
		}
		static public function evalEsVertical(linea:Linea):Boolean {
			// Evalua si la linea pasada es vertical
			var resultado:Boolean = false
			if (!isNaN(linea.c)) {
				resultado=true
			}
			return resultado
		}
		static public function evalEsHorizontal(linea:Linea):Boolean {
			// Evalua si la linea pasada es vertical
			var resultado:Boolean = false
			if (isNaN(linea.c) && linea.a==0) {
				resultado=true
			}
			return resultado
		}
	}
}