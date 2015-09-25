/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 16/02/2010 17:31
* IMPORTANTE: Todas las clases del paquete es.robertoferrero que extienden MovieClip
*             vinculados a elementos de biblioteca requieren desactivar:
*             "Declaracion instancias de escenario automaticamente" en "Configuración de publicación" en (CS3).
* IMPORTAT: All classes inside the es.robertoferrero package that extends MovieClip and are linked to Library items
*             need the "Automatically declare stage instances" UNCHECKED in "Publish Settings" (CS3)
*/
package es.robertoferrero.framework.utils{
	//---------------------------
	// IMPORTS del Package:
	//---------------------------
	// CLASSES del Package:
	public class RandomUtils{
		// import es.robertoferrero.framework.utils.RandomUtils
		//------------
		// DOCUMENTACION:
		static public function dado(caras:int):int {
			// Simula una tirada de 1 dado de tantas caras como el parametro "caras"
			var resultado:int = Math.ceil(Math.random()*caras);
			return (resultado);
		}
		static public function segmento(p1:Number, p2:Number):Number {
			// Dado un segmento p1-p2 devuelve un valor aleatorio perteneciente a ese segmento
			var rango:Number = p2-p1;
			var dado:Number = Math.random();
			var resultado:Number = p1+(dado*rango);
			return (resultado);
		}
		static public function aplicarModRnd(valor:Number, mod:Number):Number {
			// Dado un valor y modificador (0->1) devuelve un valor aleatorio entre..
			// el valor y  el valor+-(valor*mod)
			var signo:int = RandomUtils.dado(2)
			var margen:Number = valor*mod;
			var p1:Number = valor;
			var p2:Number = valor + margen;
			var rango:Number
			if(signo==1){
				rango = p2 - p1;
			}else {
				rango = p2 + p1;
			}
			var dado:Number = Math.random();
			var resultado:Number = p1+(dado*rango);
			return (resultado);
		}
		static public function sumarModRnd(valor:Number, mod:Number):Number {
			// Dado un valor y modificador (0->1) devuelve un valor aleatorio entre..
			// el valor y  el valor+(valor*mod)
			var margen:Number = valor*mod;
			var p1:Number = valor;
			var p2:Number = valor+margen;
			var rango:Number = p2-p1;
			var dado:Number = Math.random();
			var resultado:Number = p1+(dado*rango);
			return (resultado);
		}
		static public function restarModRnd(valor:Number, mod:Number):Number {
			// Dado un valor y modificador (0->1) devuelve un valor aleatorio entre..
			// el valor-(valor*mod) y valor
			var margen:Number = valor*mod;
			var p1:Number = valor-margen;
			var p2:Number = valor;
			var rango:Number = p2-p1;
			var dado:Number = Math.random();
			var resultado:Number = p1+(dado*rango);
			return (resultado);
		}
		static public function arrayRndItem(arrayTemp:Array):Object {
			// Dado un array devuelve un item al azar del array.
			var pos:Number = dado(arrayTemp.length) - 1
			return arrayTemp[pos]
		}
		
	}
}