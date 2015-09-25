/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com|| roberto@ionewmedia.com
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 200710
* Modificada: 26/09/2008 11:08
*/
package es.robertoferrero.framework.utils{
	//---------------------------
	// IMPORTS del Package:
	//---------------------------
	// CLASSES del Package:
	public class ArrayUtils {
		// import es.robertoferrero.framework.utils.ArrayUtils
		//--
		static public function existeItem(array:Array, item:Object):Boolean {
			//trace("(ArrayUtils.existeItem) array: "+array+"  item: "+item)
			var existe:Number=array.indexOf(item);
			if (existe==-1) {
				return (false);
			} else {
				return (true);
			}
		}
		static public function borrarItem(array:Array, item:Object):Array {
			var aResultado:Array = new Array();
			for (var i = 0; i<array.length; i++) {
				var valorBase = array[i];
				if (valorBase != item) {
					aResultado.push(valorBase);
				}
			}
			return aResultado;
		}
		static public function evalTodosTrue(array:Array):Boolean {
			var todosTrue:Boolean = true
			for (var i = 0; i<array.length; i++) {
				var valorBase = array[i];
				if (!valorBase) {
					todosTrue = false
				}
			}
			return todosTrue;
		}
		static public function evalMismosItems(array1:Array, array2:Array):Boolean {
			var mismosItems:Boolean = true
			if (array1.length != array2.length) {
				mismosItems = false
			}else{
				for (var i = 0; i<array1.length; i++) {
					var valorBase = array1[i];
					var existe:Boolean = existeItem(array2, valorBase)
					if (!existe) {
						mismosItems = false
					}
				}
			}
			return mismosItems;
		}
		static public function clone(array1:Array):Array {
			var aResultado:Array = new Array();
			for (var i = 0; i<array1.length; i++) {
				aResultado.push(array1[i])
			}
			return aResultado;
		}
		static public function ordenarNumericamente(a1:Array, creciente:Boolean=true):Array {
			// Dado un array devuele otro con los mismo elementos pero odenados crecientemente
			var aResultado:Array = new Array();
			aResultado.push(a1[0]);
			for (var i = 1; i<a1.length; i++) {
				var valor = a1[i];
				var pos:Number = 0;
				var esElMenor:Boolean = true;
				for (var j = 0; j<aResultado.length; j++) {
					if (valor>aResultado[j]) {
						pos = j;
						esElMenor = false;
					} else {
					}
				}
				if (esElMenor) {
					aResultado.splice(0, 0, valor);
				} else {
					aResultado.splice(pos+1, 0, valor);
				}
			}
			if (!creciente) {
				aResultado.reverse()
			}
			return (aResultado);
		}
		static public function desordenar(array1:Array):Array {
			// Dado un array devuelve otro con sus elementos desordenados
			var array2 = new Array();
			var numElem = array1.length;
			for (var i = 0; i<numElem; i++) {
				var numElemAhora = array1.length;
				var rndElem = Math.ceil(Math.random()*numElemAhora);
				array2.push(array1[rndElem-1]);
				array1.splice(rndElem-1, 1);
			}
			return array2;
		}
		
	}
}