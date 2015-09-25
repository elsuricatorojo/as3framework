/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 11/05/2009 11:34
*/
package es.robertoferrero.framework.core{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.core.utils.XMLParser_Paths
	import es.robertoferrero.framework.data.Datos;
	import es.robertoferrero.framework.utils.ArrayUtils
	//---------------------------
	// CLASSES del Package:
	public class Paths{
		// import es.robertoferrero.framework.core.Paths
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		private static var inst:Paths;
		private static var count:Number = 0;
		private static var data:Datos
		//------------
		// CONSTRUCTORA:
		public function Paths(){
			trace ("(Paths.CONSTRUCTORA)!")
			data = new Datos("data_paths")
		}
		// Singelton:
		public static function getInstance ():Paths{
			if (inst == null)	{
				inst = new Paths ();
			}
			++count;
			return inst;
		}
		//------------
		// PUBLICOS:
		public static function setXML(objXML:XML, nombreNodo:String = "paths"):void {
			trace("(Paths.setXML)!")
			var parser:XMLParser_Paths = new XMLParser_Paths(nombreNodo)
			parser.setXML(objXML)
		}
		public static  function nuevoPath(pathId:String, path:String, destino:String):void {
			trace("(Paths.nuevoPath) pathId: "+pathId)
			var existe:Boolean = data.existeItem(pathId)
			if(!existe){
				var dataTemp:Object = new Object()
				dataTemp.pathId = pathId
				dataTemp.path = path
				dataTemp.destino = destino
				data.nuevoItem(pathId, dataTemp)
			}else {
				trace("(Paths.nuevoPath) ATENCION: Ya existe el pathId que se quiere añadir: "+pathId)
			}
		}
		// Getters:
		public static function getPath(pathId:String):String {
			trace("(Paths.getPath): "+pathId)
			var path:String=null
			var existe:Boolean = data.existeItem(pathId)
			if(existe){
			var dataTemp:Object = data.getItem(pathId)
				path=dataTemp.path
			}else {
				trace("(Paths.getPath) ATENCION: El pathId solicitado NO existe!!")
			}
			return path
		}
		public static function getDestino(pathId:String):String {
			// NUEVO: 28/04/2009 11:46
			trace("(Paths.getDestino): " + pathId)
			var destino:String=null
			var existe:Boolean = data.existeItem(pathId)
			if(existe){
			var dataTemp:Object = data.getItem(pathId)
				destino=dataTemp.destino
			}else {
				trace("(Paths.getPath) ATENCION: El pathId solicitado NO existe!!")
			}
			return destino
		}
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		//------------
		// EVENTOS:
		
	}
	
}