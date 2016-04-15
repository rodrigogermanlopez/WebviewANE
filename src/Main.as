package {

import flash.display.Sprite;
import flash.text.TextField;

import studionorth.ane.WebViewANE;

public class Main extends Sprite {
	public function Main() {
		init() ;
	}

	private function init():void {
		trace( "ANE isSupported:" +  WebViewANE.isSupported ) ;
		if( WebViewANE.isSupported ){
			trace("hello!") ;
		}
		WebViewANE.instance.callContext( "unafunction", [123]) ;
	}
}
}
