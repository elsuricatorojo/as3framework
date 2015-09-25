/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 16/02/2009 16:15
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
	public class NumberUtils{
		// import es.robertoferrero.framework.utils.NumberUtils
		//--
		static public function dentroIntervalo(valor1:Number, valor2:Number, valor3:Number, limitesPertenecen:Boolean = true, precision:int=-1):Boolean {
			// Evalua si el valor3 está entre el valor1 y el valor2
			//trace("      (NumberUtils.dentroIntervalo) valor1:" + valor1 + "  valor2:" + valor2 + "  valor3:" + valor3)
			if (precision>-1) {
				valor1 = aproximacion(valor1, precision)
				valor2 = aproximacion(valor2, precision)
				valor3 = aproximacion(valor3, precision)
			}
			var resultado:Boolean = true
			var arrayRango:Array = [valor1, valor2]
			//trace("      arrayRango: "+arrayRango+"   valor3: "+valor3)
			arrayRango = ArrayUtils.ordenarNumericamente(arrayRango, true)
			//trace("      arrayRango': "+arrayRango+"   valor3: "+valor3)
			if (limitesPertenecen) {
				if (valor3>=arrayRango[0] && valor3<=arrayRango[1]) {
					resultado = true
				}else {
					resultado = false
				}
			}else {
				if (valor3>arrayRango[0] && valor3<arrayRango[1]) {
					resultado = true
				}else {
					resultado = false
				}
			}
			///trace("      resultado:"+resultado)
			return resultado
		}
		static public function aproximacion(valor:Number, precision:int):Number {
			// Devuelve une valor redondeado al numero de decimales indicado por precision
			var potencia:Number = Math.pow(10, precision)
			var resultado:Number = Math.round(valor*potencia)
			resultado=resultado/potencia
			//trace (resultado)
			return resultado
		}
	}
}