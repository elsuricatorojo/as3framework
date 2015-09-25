/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 26/09/2008 11:01
*/
package es.robertoferrero.framework.data{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.utils.ArrayUtils
	//---------------------------
	// CLASSES del Package:
	public class Datos extends Object {
		// import es.robertoferrero.framework.data.Datos
		//------------
		// PARAMETROS:
		public var id:String 
		private var dataItems:Object
		private var _arrayItems:Array // Setter/Getter
		private var _numItems:Number // Setter/Getter
		//------------
		// CONSTRUCTORA:
		function Datos(_id:String=null):void {
			//trace("(Datos.CONSTRUCTORA)!");
			id = _id
			dataItems= new Object()
			_arrayItems=new Array()
		}
		//------------
		// PUBLICOS:
		public function nuevoItem(itemId:String, data):void {
			// Añade un item al FINAL de la lista
			var existe:Boolean = ArrayUtils.existeItem(_arrayItems, itemId)
			if(existe){
				trace("(Datos.nuevoItem): "+itemId)
				trace("ATENCION: El itemId que se desea añadir ya existe!")
			}else {
				_arrayItems.push(itemId)
				if (data == null || data == undefined) {
					dataItems[itemId]=new Object()
				}else {
					dataItems[itemId] = data
				}
				_numItems = _arrayItems.length
			}
		}
		public function insertarItem(itemId:String, data):void {
			// Añade un item al INICIO de la lista
			var existe:Boolean = ArrayUtils.existeItem(_arrayItems, itemId)
			if(existe){
				trace("(Datos.insertarItem): "+itemId)
				trace("ATENCION: El itemId que se desea añadir ya existe!")
			}else {
				_arrayItems.unshift(itemId)
				if (data == null || data == undefined) {
					dataItems[itemId]=new Object()
				}else {
					dataItems[itemId] = data
				}
				_numItems = _arrayItems.length
			}
		}
		public function quitarItem(itemId:String):void {
			var existe:Boolean = ArrayUtils.existeItem(_arrayItems, itemId)
			if (existe) {
				_arrayItems = ArrayUtils.borrarItem(_arrayItems, itemId)
				dataItems[itemId] = null
				_numItems = _arrayItems.length
			}else {
				trace("(Datos.quitarItem): "+itemId)
				trace("ATENCION: El itemId que se desea eliminar no existe!")
			}
		}
		public function quitarPrimerItem():void {
			var itemId:String = _arrayItems[0]
			quitarItem(itemId)
		}
		public function getItem(itemId:String) {
			var existe:Boolean = ArrayUtils.existeItem(_arrayItems, itemId)
			if (existe) {
				return dataItems[itemId]
			}else {
				trace("(Datos.getItem): "+itemId)
				trace("ATENCION: El itemId solicitado no existe!")
			}
		}
		public function getItemIdAt(pos:Number):String {
			// Devuelve la id del item en la posición pasada (0=primero)
			return _arrayItems[pos]
		}
		public function getItemAt(pos:Number) {
			// Devuelve el item en la posición pasada (0=primero)
			//trace("(Datos.getItemAt): "+pos)
			var itemId:String = getItemIdAt(pos)
			return getItem(itemId)
		}
		public function getPrimerItem() {
			var itemId:String = _arrayItems[0]
			return getItem(itemId)
		}
		//public function eval_existeItem(itemId:String):Boolean {
		//	return ArrayUtils.existeItem(_arrayItems, itemId)
		//}
		public function existeItem(itemId:String):Boolean {
			return ArrayUtils.existeItem(_arrayItems, itemId)
		}
		public function resetear():void {
			for (var i:int = 0; i < _arrayItems.length; i++) {
				var itemId:String = _arrayItems[i]
				dataItems[itemId] = null
			}
			_arrayItems = new Array()
		}
		public function get numItems():Number {
			return _numItems
		}
		public function get arrayItems():Array {
			return _arrayItems
		}
		public function set arrayItems(arrayAux:Array):void {
			var mismosItems:Boolean = ArrayUtils.evalMismosItems(arrayAux, _arrayItems)
			if (mismosItems) {
				_arrayItems = ArrayUtils.clone(arrayAux)
			}else {
				trace("(Datos.SET arrayItems)!")
				trace("ATENCION: El arrayItems pasado (arrayAux) tiene distintos elementos que el arrayItems existente")
				trace ("   arrayAux: " + arrayAux)
				trace ("   arrayItems: "+_arrayItems)
			}
		}
		public function traceDatos():void {
			trace("------------------")
			trace("DATOS: " + id)
			trace("   arrayItems: " + arrayItems)
			trace("   numItems: " + numItems)
			for (var i = 0; i < arrayItems.length; i++ ) {
				var itemId:String = arrayItems[i]
				trace("   itemId: " + itemId)
				var item:Object = getItem(itemId) as Object
				for (var param:Object in item) {
					trace("      "+param+": "+item[param])
				}
			}
			trace("------------------")
		}
		// NUEVO: 18/01/2011 12:57
		public function fundirDatos(data1:Datos, remplazar:Boolean = true):void {
			trace("(Datos.fundirDatos)!")
			// Añade los items y sus datos de una instancia de Datos a la presente instancia de Datos.
			trace("   this.arrayItems': "+this.arrayItems)
			trace("   data1.arrayItems: "+data1.arrayItems)
			for (var i = 0; i < data1.arrayItems.length; i++ ) {
				var itemId:String = data1.arrayItems[i]
				trace("   itemId: "+itemId)
				var obj:Object = data1.getItem(itemId) as Object
				var existe:Boolean = existeItem(itemId)
				if (existe) {
					if (remplazar) {
						trace("ATENCION: Existia ya un item con id: "+itemId+". Al ser remplazar=true se sustituye su valor!")
						quitarItem(itemId)
						nuevoItem(itemId, obj)
					}else {
						trace("ATENCION: Existia ya un item con id: "+itemId+". Al ser remplazar=false no se hace nada!")
					}
				}else {
					nuevoItem(itemId, obj)
				}
			}
			trace("   this.arrayItems'': "+this.arrayItems)
		}
		//------------
		// PRIVADOS:
		//------------
		// EVENTOS:
		//------------
		// EMISOR:
	}
}