/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com|| roberto@ionewmedia.com
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 18/06/2008 17:31
*/
package es.robertoferrero.framework.utils {
	//---------------------------
	// IMPORTS del Package:
	//---------------------------
	// CLASSES del Package:
	public class StringUtils {
		static public function eliminarAndpersandsExtremos(cadena:String):String {
			// Dada una cadena devuelve otra quitandole el primer o ultimo caracter si estos son "&"
			// Util para parsear con URLVariables cadenas de variables como "&error=0&" la cual da error.
			var posInicio:Number = 0
			var posFinal:Number = cadena.length
			if (cadena.charAt(0)=="&") {
				posInicio=1
			}
			if (cadena.charAt(cadena.length-1)=="&") {
				posFinal=cadena.length-1
			}
			var cadenaResultado:String = cadena.slice(posInicio, posFinal)
			//trace ("   cadena: " + cadena)
			//trace ("   cadenaResultado: " + cadenaResultado)
			return cadenaResultado
		}
	}
	
}