import Foundation
import UIKit

let mySpecialNotificationKey = "com.andrewcbancroft.specialNotificationKey"

class FirstViewController: UIViewController {
	@IBOutlet weak var sentNotificationLabel: UILabel!
	var i = 0
	override func viewDidLoad() {
		super.viewDidLoad()

        
		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(FirstViewController.updateNotificationSentLabel(_:)), name: mySpecialNotificationKey, object: nil)
	}
	
	@IBAction func notify() {
        let mynumber=1;
        let mytext="mytext";

        let myDict = [ "number": mynumber, "text":mytext]
		NSNotificationCenter.defaultCenter().postNotificationName(mySpecialNotificationKey,
                                            object: myDict)
//        NSNotificationCenter.defaultCenter().postNotificationName(mySpecialNotificationKey,
//                                                                  object: self, userInfo: ["testdata":"test 1 2 3"])
	}
	
	func updateNotificationSentLabel(notification: NSNotification) {
        let dict = notification.object as! NSDictionary
        let receivednumber = dict["number"]
        let receivedString = dict["text"]
        print(receivedString ,"1st ##")
		self.sentNotificationLabel.text = "\(receivednumber) Notification sent!"
	}
}

