/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 16/02/2009 15:35
* IMPORTANTE: Todas las clases del paquete es.robertoferrero que extienden MovieClip
*             vinculados a elementos de biblioteca requieren desactivar:
*             "Declaracion instancias de escenario automaticamente" en "Configuración de publicación" en (CS3).
* IMPORTAT: All classes inside the es.robertoferrero package that extends MovieClip and are linked to Library items
*             need the "Automatically declare stage instances" UNCHECKED in "Publish Settings" (CS3)
*/
package es.robertoferrero.framework.geom.utils{
	import es.robertoferrero.framework.geom.Linea;
	import es.robertoferrero.framework.geom.Segmento;
	import es.robertoferrero.framework.geom.utils.LineaUtils
	import es.robertoferrero.framework.utils.NumberUtils
	import flash.geom.Point;
	//---------------------------
	// IMPORTS del Package:
	//---------------------------
	// CLASSES del Package:
	public class SegmentoUtils{
		// import es.robertoferrero.framework.geom.utils.SegmentoUtils
		//--
		static public function evalInterseccionan(s1:Segmento, s2:Segmento):Boolean {
			//trace("   (SegmentoUtils.evalInterseccionan)!" )
			//trace("      s1:" + s1)
			//trace("      s2:" + s2)
			//trace("      ---")
			var interseccionan:Boolean = false
			var linea1:Linea = LineaUtils.getLine(s1.p1, s1.p2)
			var linea2:Linea = LineaUtils.getLine(s2.p1, s2.p2)
			var interseccion:Point = LineaUtils.puntoInterseccion(linea1, linea2)
			if(interseccion!=null){
				var pertenece_s1:Boolean = pertenece(s1, interseccion)
				var pertenece_s2:Boolean = pertenece(s2,interseccion)
				//trace("   linea1:" + linea1)
				//trace("   linea2:" + linea2)
				//trace("   interseccion:" + interseccion)
				//trace("   pertenece_s1:" + pertenece_s1)
				//trace("   pertenece_s2:" + pertenece_s2)
				if (pertenece_s1 && pertenece_s2) {
					// El punto de interseccion pertenece a los 2 segmentos
					interseccionan = true
				}else {
					// El punto de interseccion NO pertenece al menos a uno de los 2 segmentos
					interseccionan = false
				}
				//trace("   interseccionan: "+interseccionan)
			}else {
				interseccionan =false
			}
			return interseccionan
		}
		static public function puntoInterseccion(s1:Segmento, s2:Segmento):Point {
			// Si no se cruzan devuelve null
			var linea1:Linea = s1.linea
			var linea2:Linea = s2.linea
			var interseccion:Point = LineaUtils.puntoInterseccion(linea1, linea2)
			//trace("  interseccion: "+interseccion)
			if(interseccion!=null){
				var pertenece_s1:Boolean = pertenece(s1, interseccion)
				var pertenece_s2:Boolean = pertenece(s2, interseccion)
				if (pertenece_s1 && pertenece_s2) {
					// El punto de interseccion pertenece a los 2 segmentos. Se devuelve el pto 'interseccion'
				}else {
					// El punto de interseccion NO pertenece al menos a uno de los 2 segmentos
					interseccion = null
				}
			}else {
				interseccion = null
			}
			return interseccion
		}
		static public function pertenece(s1:Segmento, p1:Point):Boolean {
			// Evalua si un punto pertenece a un segmento considerando sus limites como parte del segmento.
			//trace("   (SegmentoUtils.pertenece)!")
			var resultado:Boolean=false
			var linea:Linea = s1.linea
			//trace("  s1: " + s1)
			//trace("  p1: " + p1)
			//trace("  linea: " + linea)
			//trace("   x: " + linea.get_x(p1.y))
			//trace("   y: " + linea.get_y(p1.x))
			var estaEnLinea:Boolean = LineaUtils.pertenece(linea, p1)
			//trace("     estaEnLinea: " + estaEnLinea)
			if (estaEnLinea) {
				//trace("  s1.p1: " + s1.p1)
				//trace("  s1.p2: " + s1.p2)
				//trace("   -")
				var dentroX:Boolean = NumberUtils.dentroIntervalo(s1.p1.x, s1.p2.x, p1.x, true, 6)
				//trace("   dentroX: " + dentroX)
				var dentroY:Boolean = NumberUtils.dentroIntervalo(s1.p1.y, s1.p2.y, p1.y, true, 6)
				//trace("   dentroY: " + dentroY)
				if (dentroX && dentroY) {
					resultado=true
				}else {
					//trace("Las lineas interseccionan pero los segmentos no.")
				}
			}
			//trace("(SegmentoUtils.pertenece) resultado: " + resultado)
			return resultado
		}
	}
}