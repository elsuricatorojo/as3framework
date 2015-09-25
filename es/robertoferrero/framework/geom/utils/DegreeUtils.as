/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 16/02/2009 13:02
* IMPORTANTE: Todas las clases del paquete es.robertoferrero que extienden MovieClip
*             vinculados a elementos de biblioteca requieren desactivar:
*             "Declaracion instancias de escenario automaticamente" en "Configuración de publicación" en (CS3).
* IMPORTAT: All classes inside the es.robertoferrero package that extends MovieClip and are linked to Library items
*             need the "Automatically declare stage instances" UNCHECKED in "Publish Settings" (CS3)
*/
package es.robertoferrero.framework.geom.utils{
	//---------------------------
	// IMPORTS del Package:
	//---------------------------
	// CLASSES del Package:
	public class DegreeUtils{
		// import es.robertoferrero.framework.geom.utils.DegreeUtils
		//--
		/**
		* Takes an angle in degrees and returns its sine.
		* 
		* @param	angle	The angle in degrees.
		* @return	Returns the sine of the angle.
		* 
		* @usage	<pre><code>trace (Degree.sinD(90));</code></pre>
		*/
		public static function sinD(angle:Number):Number {
			return Math.sin(angle*(Math.PI/180));
		}
		/**
		* Takes an angle in degrees and returns its cosine.
		* 
		* @param	angle	The angle in degrees.
		* @return	Returns the cosine of the angle.
		* 
		* @usage	<pre><code>trace (Degree.cosD(0));</code></pre>
		*/
		public static function cosD(angle:Number):Number {
			return Math.cos(angle*(Math.PI/180));
		}
		/**
		* Takes an angle in degrees and returns its tangent.
		* 
		* @param	angle	The angle in degrees.
		* @return	Returns the tangent of the angle.
		* 
		* @usage	<pre><code>trace (Degree.tanD(45));</code></pre>
		*/
		public static function tanD(angle:Number):Number {
			return Math.tan(angle*(Math.PI/180));
		}
		/**
		* Takes the inverse sine of a slope ratio and returns its angle in degrees.
		* 
		* @param	ratio	The slope ratio.
		* @return	Returns the angle in degrees.
		* 
		* @usage	<pre><code>trace (Degree.asinD(1));</code></pre>
		*/
		public static function asinD(ratio:Number):Number {
			return Math.asin(ratio)*(180/Math.PI);
		}
		/**
		* Takes the inverse cosine of a slope ratio and returns its angle in degrees.
		* 
		* @param	ratio	The slope ratio.
		* @return	Returns the angle in degrees.
		* 
		* @usage	<pre><code>trace (Degree.acosD(1));</code></pre>
		*/
		public static function acosD(ratio:Number):Number {
			return Math.acos(ratio)*(180/Math.PI);
		}
		/**
		* Takes the inverse tangent of a slope ratio and returns its angle in degrees.
		* 
		* @param	ratio	The slope ratio.
		* @return	Returns the angle in degrees.
		* 
		* @usage	<pre><code>trace (Degree.atanD(1));</code></pre>
		*/
		public static function atanD(ratio:Number):Number {
			return Math.atan(ratio)*(180/Math.PI);
		}
		/**
		* Takes the inverse tangent of a slope ratio and returns its angle in degrees.
		* 
		* @param	y	The y coordinate of the slope ratio.
		* @param	x	The x coordinate of the slope ratio.
		* @return	Returns the angle in degrees.
		* 
		* @usage	<pre><code>trace (Degree.atan2D(7, 7));</code></pre>
		*/
		public static function atan2D(y:Number, x:Number):Number {
			return Math.atan2(y, x)*(180/Math.PI);
		}
		
	}
	
}