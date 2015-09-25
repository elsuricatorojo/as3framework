/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 11/05/2009 12:40
* IMPORTANTE: Todas las clases del paquete es.robertoferrero que extienden MovieClip
*             vinculados a elementos de biblioteca requieren desactivar:
*             "Declaracion instancias de escenario automaticamente" en "Configuración de publicación" en (CS3).
* IMPORTAT: All classes inside the es.robertoferrero package that extends MovieClip and are linked to Library items
*             need the "Automatically declare stage instances" UNCHECKED in "Publish Settings" (CS3)
*/
package es.robertoferrero.framework.xml.utils{
	import flash.xml.XMLNode;
	//---------------------------
	// IMPORTS del Package:
	//---------------------------
	// CLASSES del Package:
	public class XMLUtils{
		// import es.robertoferrero.framework.xml.utils.XMLUtils
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		//------------
		// CONSTRUCTORA:
		/*
		static public function extraerAtributoNodo(nodo:XMLNode, nombreSubNodo:String, atributo:String):String {
			//trace("(XML2.extraerAtributoNodo)!");
			// Dado un objeto XML 'nodo' lo examina y devuelve el valor del atributo especificado
			// por el parametro 'atributo' del subnodo especificado por 'nombreSubNodo' 
			//var subNodos:XMLNode;
			var resultado:String
			var nombreNodo:String;
			var nodoAnalizado:Array = nodo.childNodes;
			for (var subNodos in nodoAnalizado) {
				nombreNodo = nodoAnalizado[subNodos].nodeName;
				if (nombreNodo == nombreSubNodo) {
					//trace("(IntEntrada_int.xml_extraerAtributoNodo) Atributo "+atributo+":"+nodoAnalizado[subNodos].attributes[atributo]);
					 resultado = (nodoAnalizado[subNodos].attributes[atributo]);
					break;
				}
			}
			return resultado
		}
		
		static public function extraerValorNodo(nodo:XMLNode, nombreSubNodo:String):String {
			//trace("(XML2.extraerValorNodo)!");
			// Dado un objeto XML lo examina y devuelve el nodeValue del subnodo cuyo nombre
			// coincida con "nombreSubNodo"
			var resultado:String
			var nombreNodo:String;
			var nodoAnalizado:Array = nodo.childNodes;
			for (var subNodos in nodoAnalizado) {
				nombreNodo = nodoAnalizado[subNodos].nodeName;
				if (nombreNodo == nombreSubNodo) {
					//trace("(XML2.extraerValorNodo) "+nombreSubNodo+":"+nodoAnalizado[subNodos].firstChild.nodeValue);
					resultado =  (nodoAnalizado[subNodos].firstChild.nodeValue);
					break;
				}
			}
			return resultado
		}
		*/
		static public function getValorNodo(listaXML:XMLList, nombreNodo:String):String {
			//trace("(XML2.getValorNodo)!");
			// Dado un XMLList, busca entre los nodos que contiene...
			// ...y devuelve el valor del nodo cuyo nombre coincide con nombreNodo
			var resultado:String = null
			for (var i in listaXML) {
				var nodo:XML = listaXML[i]
				var nombreNodoTemp:String = nodo.name()
				if (nombreNodoTemp == nombreNodo) {
					//trace("(XML2.extraerValorNodo) "+nombreSubNodo+":"+nodoAnalizado[subNodos].firstChild.nodeValue);
					resultado =  nodo.valueOf().toString()
					break;
				}
			}
			return resultado
		}
		static public function evalExisteNodo(listaXML:XMLList, nombreNodo:String):Boolean {
			//trace("(XML2.evalExisteNodo): "+nombreNodo);
			// Dado un XMLList, busca a ver si contiene un subnodo llamado gual que 'nombreNodo'
			var existe:Boolean = false
			for (var i in listaXML) {
				var nodo:XML = listaXML[i]
				var nombreNodoTemp:String = nodo.name()
				if (nombreNodoTemp == nombreNodo) {
					//trace("(XML2.extraerValorNodo) "+nombreSubNodo+":"+nodoAnalizado[subNodos].firstChild.nodeValue);
					existe = true
					break;
				}
			}
			return existe	
		}
		/*
		static public function posicionSubnodo(nodo:XMLNode, nombreSubNodo:String):Number {
			//trace("(XML2.posicionSubnodo)!");
			// Dado un objeto XML 'nodo' lo examina y devuelve la posicion del subnodo especificado
			// por el parametro 'nombreSubNodo'
			var resultado:Number
			var nombreNodo:String;
			var nodoAnalizado:Array = nodo.childNodes;
			for (var subNodos in nodoAnalizado) {
				nombreNodo = nodoAnalizado[subNodos].nodeName;
				if (nombreNodo == nombreSubNodo) {
					//trace("(IntEntrada_int.xml_posicionSubnodo) Posición subNodo("+nombreSubNodo+"):"+subNodos);
					resultado =  Number(subNodos);
					break;
				}
			}
			return resultado
		}
		*/
		//------------
		// PUBLICOS:
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