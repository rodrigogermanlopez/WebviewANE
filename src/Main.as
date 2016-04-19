package {

//import com.genesi.desktop.ScreenShooter;

import com.genesi.desktop.ScreenShooter;

import flash.display.NativeWindow;
import flash.display.NativeWindowInitOptions;
import flash.display.NativeWindowSystemChrome;
import flash.display.NativeWindowType;
import flash.display.Screen;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.geom.ColorTransform;
import flash.geom.Rectangle;
import flash.html.HTMLLoader;
import flash.net.URLRequest;
import flash.utils.ByteArray;

import studionorth.ane.WebViewANE;

public class Main extends Sprite {

	private var mainWindow:NativeWindow;

	public function Main() {
		init();
	}

	private function init():void {
		// test 1
		//var s:ScreenShooter = new ScreenShooter();
		//var ba:ByteArray = s.getScreenShot() ;
		//trace("output bytearray length()::", ba.length ) ;

		trace( "ANE isSupported:" + WebViewANE.isSupported );
		if ( !WebViewANE.isSupported ) return;

		var msg = WebViewANE.instance.callContext( "PrintString", ["A test string hello world"] );
 		trace ( msg );

		var result:String = WebViewANE.instance.context.call( "PrintString", "someParameter" ) as String;
		trace( result) ;

		var msg = WebViewANE.instance.callContext( "WebView" );
		trace( msg) ;


	}
}
}
