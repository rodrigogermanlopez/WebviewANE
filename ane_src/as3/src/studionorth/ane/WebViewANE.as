/**
 * Code by Rodrigo López Peker (grar) on 4/15/16 12:05 PM.
 *
 */
package studionorth.ane {
import flash.events.EventDispatcher;
import flash.events.StatusEvent;
import flash.external.ExtensionContext;
import flash.system.Capabilities;

public class WebViewANE extends EventDispatcher {

	public static function get isSupported():Boolean {
		// for now, just windows.
		if ( Capabilities.manufacturer.indexOf( "Win" ) == -1 ) {
			return false;
		}
		return true;
	}

	public static function get instance():WebViewANE {
		return _instance ? _instance : new WebViewANE();
	}

	// trace messages for debug.
	public var verbose:Boolean = false;

	/**
	 * "private" Constructor
	 * (Singleton class, call WebViewANE.instance instead).
	 */
	public function WebViewANE() {
		if ( !_instance ) {
			_context = ExtensionContext.createExtensionContext( EXTENSION_ID, null );
			if ( !_context ) {
				throw Error( "ERROR - Extension context is null. Please check if extension.xml is setup correctly." );
			}
			_instance = this;
		} else {
			throw Error( "This is a singleton, use WebViewANE.instance, do not call the constructor directly." );
		}
	}

	/**
	 * Dynamic call to context...
	 * @param functionName
	 * @param args
	 */
	public function callContext( functionName:String, args:Array = null ):Object {
		if ( !_context ) {
			log( "ERROR:: platform not supported." );
			return null ;
		}
		if ( !args ) args = [];
		log( "callContext() functionName=" + functionName + " args=" + args );
		args.unshift( functionName );
		// inject the args Array as parameters of the call() function.
		return _context.call.apply( null, args );
//		_context.call( functionName, args[0], args[1], args[2] ) ; // instead of this
	}

	/**
	 * Listen to context events ...
	 * @param flag
	 */
	public function listenEvents( flag:Boolean ):void {
		if ( _context ) {
			if ( flag ) _context.addEventListener( StatusEvent.STATUS, onStatus );
			else _context.removeEventListener( StatusEvent.STATUS, onStatus );
		} else {
			log( " ERROR:: platform not supported." );
		}
	}

	/**
	 * Dispose the native context.
	 * Maybe we should include dispose() on the context as well...?
	 */
	public function dispose():void {
		log( "dispose()" );
		listenEvents( false );
		if ( _context ) _context.dispose();
		_context = null;
	}


	// central point to get context events
	private function onStatus( event:StatusEvent ):void {

		log( "onStatus() code=" + event.code + " level=" + event.level );

		if ( hasEventListener( event.type ) )
			dispatchEvent( event );
	}

	//===================================================================================================================================================
	//
	//      ------  PRIVATE API
	//
	//===================================================================================================================================================
	private static const EXTENSION_ID:String = "studionorth.ane.WebViewANE";
	private static var _instance:WebViewANE;
	private var _context:ExtensionContext;

	private function log( ...args ):void {
		if ( !verbose ) return;
		trace( "[WebViewANE] " + args.join( " " ) );
	}

}
}
