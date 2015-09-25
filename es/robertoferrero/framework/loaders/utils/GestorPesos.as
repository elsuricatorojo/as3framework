/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 20/04/2009 13:42
* IMPORTANTE: Todas las clases del paquete es.robertoferrero que extienden MovieClip
*             vinculados a elementos de biblioteca requieren desactivar:
*             "Declaracion instancias de escenario automaticamente" en "Configuración de publicación" en (CS3).
* IMPORTAT: All classes inside the es.robertoferrero package that extends MovieClip and are linked to Library items
*             need the "Automatically declare stage instances" UNCHECKED in "Publish Settings" (CS3)
*/
package es.robertoferrero.framework.loaders.utils{
	
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.data.Datos;
	//---------------------------
	// CLASSES del Package:
	public class GestorPesos{
		// import es.robertoferrero.framework.loaders.utils.GestorPesos
		//------------
		// DOCUMENTACION:
		// La funcionalidad de esta clase consiste en calcular los porcentajes de carga...
		// en base a pesosRelativos pasados.
		// Los pesos relativos serán valores numericos positivos.
		//------------
		// PARAMETROS:
		private var items:Datos
		//------------
		// CONSTRUCTORA:
		public function GestorPesos(){
			// trace ("(GestorPesos.CONSTRUCTORA)!")
			items = new Datos("datos_gestorPesos")
		}
		//------------
		// PUBLICOS:
		public function nuevaCarga(cargaId:String, pesoRelativo:Number):Boolean {
			trace ("(GestorPesos.nuevaCarga) cargaId: "+cargaId+"   pesoRelativo: "+pesoRelativo)
			var existe:Boolean = items.existeItem(cargaId)
			if (!existe) {
				var obj:Object = new Object()
				obj.cargaId = cargaId
				obj.pesoRelativo = pesoRelativo
				items.nuevoItem(cargaId, obj)
				return true
			}else {
				// trace ("(GestorPesos.CONSTRUCTORA)!")
				trace("ATENCION: Ya existe una cargaId con ese nombre (" + cargaId + "). No se hace nada.")
				return false
			}
		}
		public function get_porcentajeCarga(cargaId:String, porcentajeCarga:Number):Number {
			//trace ("(GestorPesos.nuevaCarga) cargaId: "+cargaId+"   porcentajeCarga: "+porcentajeCarga)
			var pesoTotal:Number = get_pesoTotal()
			//trace("   pesoTotal: "+pesoTotal)
			var pesoAcumulado:Number = 0
			var itemsAnteriores:Boolean = true
			for (var i = 0; i < items.numItems; i++) {
				var itemId:String = items.getItemIdAt(i)
				var objItem:Object = items.getItemAt(i)
				if (itemId == cargaId) {
					itemsAnteriores = false
					pesoAcumulado += objItem.pesoRelativo*(porcentajeCarga/100)
				}else {
					if(itemsAnteriores){
						pesoAcumulado += objItem.pesoRelativo
					}
				}
			}
			//trace("   pesoAcumulado: "+pesoAcumulado)
			var porcentajeCarga:Number = (pesoAcumulado / pesoTotal) * 100
			//trace("   porcentajeCarga: "+porcentajeCarga)
			return porcentajeCarga
		}
		// Getters/ Setters:
		public function get_pesoTotal():Number {
			var pesoTotal:Number = 0
			for (var i = 0; i < items.numItems; i++) {
				var objItem:Object = items.getItemAt(i)
				pesoTotal += objItem.pesoRelativo
			}
			return pesoTotal
		}
		//------------
		// PRIVADOS:
		
		//------------
		// EVENTOS:
		
	}
	
}