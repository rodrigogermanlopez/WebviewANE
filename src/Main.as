package {

import com.genesi.desktop.ScreenShooter;

import flash.display.Sprite;
import flash.utils.ByteArray;

import studionorth.ane.WebViewANE;

public class Main extends Sprite {
	public function Main() {
		init();
	}

	private function init():void {

		// test 1
		var s:ScreenShooter = new ScreenShooter();
		var ba:ByteArray = s.getScreenShot() ;
		trace("output bytearray length()::", ba.length ) ;

		trace( "ANE isSupported:" + WebViewANE.isSupported );
		if ( !WebViewANE.isSupported ) return;
		WebViewANE.instance.callContext( "as_passAString", ["A test string hello world"] );
	}
}
}
