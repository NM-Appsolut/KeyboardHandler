# KeyboardHandler

This class is a simple handler for the appearance of the system keyboard during editing in UITextField or UITextView. It will adjust the position of the textfields/textviews accordingly so they will not be overlapped by the keyboard.

## Benefits

 - Easy to use
 - Avoids duplicate implementations
 - No calculation of keyboard height etc. needed

## Usage

It is mandatory that your **ViewController** contains an **UIScrollView**.

    import UIKit
    
    class ViewController: UIViewController, KeyboardHandler {
    
		@IBOutlet  private  weak  var  scrollView: UIScrollView!
		
		override func viewDidLoad() {
			super.viewDidLoad()
			subscribeKeyboard(with: scrollView)
		}
	
		override  func  viewWillDisappear(_ animated: Bool) {
			super.viewWillDisappear(animated)
			unsubscribeKeyboard()
		}
	}

## License

MIT license. See the [LICENSE](https://github.com/NM-Appsolut/KeyboardHandler/blob/master/LICENSE) for details.
