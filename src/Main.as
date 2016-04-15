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
		trace("output::", ba ) ;


		/*protected function takeScreenShot():void
		{
			// TODO Auto-generated method stub
			var s:ScreenShooter = new ScreenShooter();
			var ba:ByteArray = s.getScreenShot();

			var loader:Loader = new Loader();
			loader.loadBytes(ba);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
		}

		private function loadComplete(e:Event):void
		{
			shot.source = e.target.content.bitmapData as BitmapData;

		}

		protected function tsButton_clickHandler(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			takeScreenShot();
		}*/

		trace( "ANE isSupported:" + WebViewANE.isSupported );
		if ( !WebViewANE.isSupported ) return;
		WebViewANE.instance.callContext( "as_passAString", ["A test string hello world"] );
	}
}
}
