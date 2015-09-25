/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 18/01/2011 10:54
* IMPORTANTE: Todas las clases del paquete com.ionewmedia que extienden MovieClip
*             vinculados a elementos de biblioteca requieren desactivar:
*             "Declaracion instancias de escenario automaticamente" en "Configuración de publicación" en (CS3).
* IMPORTAT: All classes inside the com.ionewmedia package that extends MovieClip and are linked to Library items
*             need the "Automatically declare stage instances" UNCHECKED in "Publish Settings" (CS3)
*/
package es.robertoferrero.juegos.utils.lib{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.data.Datos;
	import es.robertoferrero.framework.utils.ArrayUtils
	import es.robertoferrero.juegos.IMainJuego;
	import es.robertoferrero.juegos.utils.datos.DataPath;
	//--
	import es.robertoferrero.juegos.utils.xml.XMLParser_Paths
	//---------------------------
	// CLASSES del Package:
	public class LibPaths{
		// import es.robertoferrero.juegos.utils.lib.LibPaths
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		private var data:Datos
		private var main:IMainJuego
		//------------
		// CONSTRUCTORA:
		public function LibPaths(_main:IMainJuego){
			// trace ("(LibPaths.CONSTRUCTORA)!")
			main = _main
			data = new Datos("data_paths")
			
		}
		//------------
		// PUBLICOS:
		public function setXML(objXML:XML, nombreNodo:String = "paths"):void {
			trace("(LibPaths.setXML)!")
			var parser:XMLParser_Paths = new XMLParser_Paths(nombreNodo)
			parser.setXML(objXML)
			data.fundirDatos(parser.getDatos(), true)
		}
		public function nuevoPath(pathId:String, path:String, destino:String):void {
			trace("(LibPaths.nuevoPath) pathId: "+pathId)
			var existe:Boolean = data.existeItem(pathId)
			if(!existe){
				var dataTemp:DataPath = new DataPath(pathId, path, destino)
				data.nuevoItem(pathId, dataTemp)
			}else {
				trace("(LibPaths.nuevoPath) ATENCION: Ya existe el pathId que se quiere añadir: "+pathId)
			}
		}
		// Getters:
		public  function getPath(pathId:String):String {
			trace("(LibPaths.getPath): "+pathId)
			var path:String=null
			var existe:Boolean = data.existeItem(pathId)
			if(existe){
				var dataPath:DataPath = data.getItem(pathId) as DataPath
				path= dataPath.url
			}else {
				trace("(LibPaths.getPath) ATENCION: El pathId solicitado NO existe!!")
			}
			return path
		}
		public  function getDestino(pathId:String):String {
			trace("(LibPaths.getDestino): " + pathId)
			var destino:String=null
			var existe:Boolean = data.existeItem(pathId)
			if(existe){
				var dataPath:DataPath = data.getItem(pathId) as DataPath
				destino=dataPath.destino
			}else {
				trace("(LibPaths.getPath) ATENCION: El pathId solicitado NO existe!!")
			}
			return destino
		}
		public function getPathDestino(pathId:String):Array {
			var arrayTemp:Array = new Array()
			var existe:Boolean = data.existeItem(pathId)
			if (existe) {
				arrayTemp[0] = getPath(pathId)
				arrayTemp[1] = getDestino(pathId)
			}else {
				trace("(LibPaths.getPathDestino) ATENCION: El pathId solicitado NO existe!!")
			}
			return arrayTemp
		}
		public function getDataPath(pathId:String):DataPath {
			var dataPath:DataPath
			var existe:Boolean = data.existeItem(pathId)
			if (existe) {
				dataPath = data.getItem(pathId) as DataPath
			}else {
				trace("(LibPaths.getPathDestino) ATENCION: El pathId solicitado NO existe!!")
			}
			return dataPath
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