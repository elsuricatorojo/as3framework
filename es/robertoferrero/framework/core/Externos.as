/*
DOCUMENTACION:
* Roberto Ferrero - roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 07/10/2011 18:27
*/
package es.robertoferrero.framework.core{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.core.datos.DataExternos;
	import es.robertoferrero.framework.core.datos.TipoExternos;
	import es.robertoferrero.framework.core.utils.XMLParser_Externos
	import es.robertoferrero.framework.data.Datos;
	import es.robertoferrero.framework.loaders.Buffer;
	import es.robertoferrero.framework.loaders.Cargador;
	import es.robertoferrero.framework.loaders.CargadorDisplayObj
	import es.robertoferrero.framework.loaders.CargadorMP3;
	import es.robertoferrero.framework.loaders.CargadorXML;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	//---------------------------
	// CLASSES del Package:
	public class Externos{
		// import es.robertoferrero.framework.core.Externos
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		private static var inst:Externos;
		private static var count:Number = 0;
		private static var data:Datos
		//------------
		// CONSTRUCTORA:
		public function Externos(){
			trace ("(Externos.CONSTRUCTORA)!")
			data = new Datos("data_paths")
		}
		// Singelton:
		public static function getInstance ():Externos{
			if (inst == null)	{
				inst = new Externos ();
			}
			++count;
			return inst;
		}
		//------------
		// PUBLICOS:
		public static function setXML(objXML:XML, nombreNodo:String = "externos"):void {
			trace("(Externos.setXML)!")
			var parser:XMLParser_Externos = new XMLParser_Externos(nombreNodo)
			parser.setXML(objXML)
		}
		public static  function nuevoExterno(dataExterno:DataExternos):void {
			trace("(Externos.nuevoExterno) externoId: "+dataExterno.externoId)
			var existe:Boolean = data.existeItem(dataExterno.externoId)
			if(!existe){
				data.nuevoItem(dataExterno.externoId, dataExterno)
			}else {
				trace("(Externos.nuevoPath) ATENCION: Ya existe el externoId que se quiere añadir: "+dataExterno.externoId)
			}
		}
		public static function nutrirBuffer(buffer:Buffer):void {
			trace("(Externos.nutrirBuffer)!")
			// Pasado un buffer Externos lo nutre con las cargas de los externos dados de alta.
			for (var i:Number = 0; i < data.numItems; i++) {
				var externo:DataExternos = data.getItemAt(i)
				var tipo:String = externo.tipo
				var cargador:Cargador
				if (tipo == TipoExternos.TIPO_IMG || tipo == TipoExternos.TIPO_SWF) {
					cargador = new CargadorDisplayObj(externo.path, externo.externoId, buffer)
				}else if (tipo == TipoExternos.TIPO_XML) {
					cargador = new CargadorXML(externo.path, externo.externoId, buffer)
				}else if (tipo == TipoExternos.TIPO_MP3) {
					cargador = new CargadorMP3(externo.path, externo.externoId, buffer)
				}
				trace("   externo.externoId: " + externo.externoId)
				trace("   externo.path: " + externo.path)
				trace("   externo.peso: " + externo.peso)
				trace("   externo.tipo: "+externo.tipo)
				buffer.nuevaCarga(cargador, externo.peso)
			}
		}
		// Getters:
		public static function getData(externoId:String):DataExternos {
			trace("(Externos.getData): "+externoId)
			var existe:Boolean = data.existeItem(externoId)
			var dataExterno:DataExternos
			if(existe){
				dataExterno = data.getItem(externoId)
			}else {
				trace("(Externos.getData) ATENCION: El externoId solicitado NO existe!!")
			}
			return dataExterno
		}
		public static function getRef(externoId:String):Object {
			trace("(Externos.getRef): "+externoId)
			var existe:Boolean = data.existeItem(externoId)
			var dataExterno:DataExternos
			var ref:Object
			if(existe){
				dataExterno = data.getItem(externoId)
				ref = dataExterno.getRef()
			}else {
				trace("(Externos.getRef) ATENCION: El externoId ("+externoId+") solicitado NO existe!!")
			}
			return ref
		}
		public static function getTipo(externoId:String):String {
			trace("(Externos.getRef): "+externoId)
			var existe:Boolean = data.existeItem(externoId)
			var dataExterno:DataExternos
			var tipo:String
			if(existe){
				dataExterno = data.getItem(externoId)
				tipo = dataExterno.tipo
			}else {
				trace("(Externos.getTipo) ATENCION: El externoId ("+externoId+") solicitado NO existe!!")
			}
			return tipo
		}
		public static function getCopyIMG(externoId:String):Bitmap {
			trace("(Externos.getCopyIMG): "+externoId)
			var existe:Boolean = data.existeItem(externoId)
			var copia:Bitmap = null
			if (existe) {
				var dataExterno:DataExternos = data.getItem(externoId)
				var tipo:String = dataExterno.tipo
				if (tipo == TipoExternos.TIPO_IMG) {
					copia = dataExterno.getCopyIMG()
				}else {
					trace("(Externos.getIMGCopy) ATENCION: Se ha solicitado un copia de IMG ("+externoId+") que no es IMG!!")
				}
			}else {
				trace("(Externos.getIMGCopy) ATENCION: El externoId ("+externoId+") solicitado NO existe!!")
			}
			return copia
		}
		// Setters:
		public static function setRef(externoId:String, ref):void {
			trace("(Externos.setRef): "+externoId+"   ref: "+ref)
			var existe:Boolean = data.existeItem(externoId)
			if (existe) {
				var dataExterno:DataExternos = data.getItem(externoId)
				if(dataExterno.tipo == TipoExternos.TIPO_IMG || dataExterno.tipo == TipoExternos.TIPO_SWF || dataExterno.tipo == TipoExternos.TIPO_MP3){
					dataExterno.setRef(ref)
				}
			}else {
				trace("(Externos.setRef) ATENCION: El externoId ("+externoId+") solicitado NO existe!!")
			}
		}
		
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		//------------
		// EVENTOS:
		
	}
	
}