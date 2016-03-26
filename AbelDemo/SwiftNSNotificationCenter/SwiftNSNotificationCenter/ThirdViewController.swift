import Foundation
import UIKit

class ThirdViewController: UIViewController {
	@IBOutlet weak var notificationLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "actOnSpecialNotification:", name: mySpecialNotificationKey, object: nil)
	}
	
	func actOnSpecialNotification(notification: NSNotification) {
        let dict = notification.object as! NSDictionary
        let receivednumber = dict["number"]
        let receivedString = dict["text"]
        print(receivedString ,"3rd ##")
		self.notificationLabel.text = "\(receivednumber) I heard the notification, too!"
	}
}
