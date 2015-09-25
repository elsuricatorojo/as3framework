/*
DOCUMENTACION:
* Roberto Ferrero - roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 07/10/2011 18:46
*/
package es.robertoferrero.framework.core.datos{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.media.Sound;
	//---------------------------
	// IMPORTS del Package:
	//---------------------------
	// CLASSES del Package:
	public class DataExternos{
		// import es.robertoferrero.framework.core.datos.DataExternos
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		public var externoId:String
		public var peso:Number
		public var tipo:String
		public var path:String
		//--
		private var ref_IMG:DisplayObject
		private var ref_SWF:MovieClip
		private var ref_XML:XML
		private var ref_MP3:Sound
		private var ref_OTRO:Object
		//------------
		// CONSTRUCTORA:
		public function DataExternos(){
			// trace ("(DataExternos.CONSTRUCTORA)!")
		}
		//------------
		// PUBLICOS:
		public function setRef(ref):void {
			trace ("(DataExternos.setRef): "+externoId+"  ref: "+ref)
			if (tipo == TipoExternos.TIPO_IMG) {
				ref_IMG = ref as DisplayObject
			}else if (tipo == TipoExternos.TIPO_SWF) {
				ref_SWF = ref as MovieClip
			}else if (tipo == TipoExternos.TIPO_MP3) {
				ref_MP3 = ref as Sound
			}else if (tipo == TipoExternos.TIPO_XML) {
				ref_XML = ref as XML
			}else if (tipo == TipoExternos.TIPO_OTRO) {
				ref_OTRO = ref as Object
			}
		}
		public function getRef():Object {
			var ref
			if (tipo == TipoExternos.TIPO_IMG) {
				ref = ref_IMG
			}else if (tipo == TipoExternos.TIPO_SWF) {
				ref = ref_SWF
			}else if (tipo == TipoExternos.TIPO_MP3) {
				ref = ref_MP3
			}else if (tipo == TipoExternos.TIPO_XML) {
				ref = ref_XML
			}else if (tipo == TipoExternos.TIPO_OTRO) {
				ref = ref_OTRO
			}
			return ref
		}
		public function getCopyIMG():Bitmap {
			var copia:Bitmap
			if(tipo == TipoExternos.TIPO_IMG){
				copia = new Bitmap(Bitmap(ref_IMG).bitmapData);
			}
			return copia
		}
		
		// Getters:
		// Setters:
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		//------------
		// EVENTOS:
		
	}
	
}