/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 11/05/2009 11:34
*/
package es.robertoferrero.framework.xml{
	import es.robertoferrero.framework.data.Datos;
	public interface XMLParser {
		// import es.robertoferrero.framework.xml.XMLParser
		function setXML(objXML:XML):void
		function getXML():XML
		function getDatos():Datos
	}
}