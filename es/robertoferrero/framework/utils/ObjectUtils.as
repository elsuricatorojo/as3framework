/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com|| roberto@ionewmedia.com
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 200710
*/
package es.robertoferrero.framework.utils {
	//---------------------------
	// IMPORTS del Package:
	//---------------------------
	// CLASSES del Package:
	public class ObjectUtils {
		// import es.robertoferrero.framework.utils.ObjectUtils
		//--
		static public function traceObject(obj:Object, id:String):void {
			trace("================================")
			trace("TRACE OBJECT: "+id)
			for (var param:Object in obj) {
				trace("   "+param+": "+obj[param])
			}
			trace("================================")
		}
	}
	
}