package {

//import com.genesi.desktop.ScreenShooter;

import flash.desktop.NativeApplication;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageDisplayState;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.ui.Keyboard;
import flash.utils.ByteArray;

import studionorth.ane.WebViewANE;

public class Main extends Sprite {
	public function Main() {

		// adjust stage size-
		stage.scaleMode = StageScaleMode.NO_SCALE ;
		stage.align = StageAlign.TOP_LEFT ;

		stage.addEventListener(MouseEvent.MOUSE_DOWN, function(e){
			stage.nativeWindow.startMove() ;
		}) ;

		// just some keyboard input,
		// fullscreen toggle with F.
		stage.addEventListener(KeyboardEvent.KEY_DOWN, function(e:KeyboardEvent){
			// fullscreen.
			if( e.keyCode == Keyboard.F ) {
				var isFS:Boolean = stage.displayState==StageDisplayState.FULL_SCREEN_INTERACTIVE ;
				stage.displayState = isFS ? StageDisplayState.NORMAL : StageDisplayState.FULL_SCREEN_INTERACTIVE ;
				// minimize screen
			} else if( e.keyCode == Keyboard.M ){
				stage.nativeWindow.minimize() ;
			} else if( e.keyCode == Keyboard.LEFT && e.shiftKey){
				//move screen left
				stage.nativeWindow.x-=5 ;
			} else if( e.keyCode == Keyboard.RIGHT && e.shiftKey){
				//move screen right
				stage.nativeWindow.x+=5 ;
			} else if( e.keyCode == Keyboard.Q ){
				// exit the app
				NativeApplication.nativeApplication.exit(0) ;
			}
		}) ;

		stage.addEventListener(Event.RESIZE, function( e:Event ):void {
			drawBackground() ;
		}) ;

		init();
	}

	private function init():void {

		// test 1
		//var s:ScreenShooter = new ScreenShooter();
		//var ba:ByteArray = s.getScreenShot() ;
		//trace("output bytearray length()::", ba.length ) ;

		// -- TRANSPARENT WINDOW is defined in cer/certificate.xml (transparent=true, systemChrome=none).
		// no BUTTONS to interact with the "window".

		// just to give you an idea of the stage size...
		drawBackground() ;

		// -- ANE code.

		trace( "ANE isSupported:" + WebViewANE.isSupported );
		if ( !WebViewANE.isSupported ) return;

		var msg = WebViewANE.instance.callContext( "PrintString", Array("someParameter") );
 		trace ( msg );

		var msg = WebViewANE.instance.callContext( "WebView");
		trace ( msg );

	}

	private function drawBackground():void {
		graphics.clear() ;
		graphics.beginFill(0xff0000,0.2) ;
		graphics.drawRect(0,0,stage.stageWidth,stage.stageHeight) ;
		graphics.endFill() ;
	}
}
}
