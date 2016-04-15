package {

import com.itpointlab.ane.OpenCV;

import flash.display.Sprite;

import studionorth.ane.WebViewANE;

public class Main extends Sprite {
	public function Main() {
		init();
	}

	private function init():void {

		var openCv:OpenCV = new OpenCV();
		trace( "opencv.isSupported : " + openCv.isSupported );

		trace( "ANE isSupported:" + WebViewANE.isSupported );
		if ( !WebViewANE.isSupported ) return;
		WebViewANE.instance.callContext( "as_passAString", ["A test string hello world"] );
	}
}
}
