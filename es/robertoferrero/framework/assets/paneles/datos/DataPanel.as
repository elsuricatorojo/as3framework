/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 10/02/2011 11:41
* IMPORTANTE: Todas las clases del paquete com.ionewmedia que extienden MovieClip
*             vinculados a elementos de biblioteca requieren desactivar:
*             "Declaracion instancias de escenario automaticamente" en "Configuración de publicación" en (CS3).
* IMPORTAT: All classes inside the com.ionewmedia package that extends MovieClip and are linked to Library items
*             need the "Automatically declare stage instances" UNCHECKED in "Publish Settings" (CS3)
*/
package es.robertoferrero.framework.assets.paneles.datos{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.assets.paneles.IPanel;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	//---------------------------
	// CLASSES del Package:
	public class DataPanel{
		// import es.robertoferrero.framework.assets.paneles.datos.DataPanel
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		public var posicion:Point = null
		public var sizeMsk:Rectangle = null
		public var sizeContenido:Rectangle = null
		public var panel:IPanel = null
		// Deducidos:
		//------------
		// CONSTRUCTORA:
		public function DataPanel(){
			// trace ("(DataPanel.CONSTRUCTORA)!")
			
		}
		//------------
		// PUBLICOS:
		// Getters:
		public function get rangoX():Number {
			var valor:Number = undefined
			if (existenValores()) {
				valor = this.sizeContenido.width - this.sizeMsk.width
			}else {
				//valor = null
			}
			return valor
		}
		public function get rangoY():Number {
			var valor:Number = undefined
			if (existenValores()) {
				valor = this.sizeContenido.height - this.sizeMsk.height
			}else {
				//valor = null
			}
			return valor
		}
		// Setters:
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		private function existenValores():Boolean {
			if (posicion != null && sizeContenido != null && sizeMsk!= null) {
				return true
			}else {
				return false
			}
		}
		private function existenValoresYPanel():Boolean {
			if (posicion != null && sizeContenido != null && sizeMsk!= null && panel != null) {
				return true
			}else {
				return false
			}
		}
		//------------
		// EVENTOS:
		
	}
	
}