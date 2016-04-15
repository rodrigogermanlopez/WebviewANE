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
		if( !WebViewANE.isSupported ) return ;
		WebViewANE.instance.callContext( "as_passAString", ["A test string hello world"]) ;
	}
}
}
