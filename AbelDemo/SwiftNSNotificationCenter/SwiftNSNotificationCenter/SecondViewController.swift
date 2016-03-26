import Foundation
import UIKit

class SecondViewController: UIViewController {
	@IBOutlet weak var notificationLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "actOnSpecialNotification:", name: mySpecialNotificationKey, object: nil)
	}
	
	func actOnSpecialNotification(notification: NSNotification) {
//        let userInfo = notification.userInfo as! [String: AnyObject]
//        let test = userInfo["testdata"] as! NSString
//        print("#",test)
        let dict = notification.object as! NSDictionary
        let receivednumber = dict["number"]
        let receivedString = dict["text"]
        print(receivedString ,"2nd ##")
		self.notificationLabel.text = "\(receivednumber) I heard the notification! "
	}
}
