import UIKit

class ViewController: UIViewController {

    fileprivate static let rootKey = "rootKey"

    @IBOutlet var lineFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var database: OpaquePointer? = nil
        var result = sqlite3_open(dataFilePath(), &database)
        if result != SQLITE_OK {
            sqlite3_close(database)
            print("Failed to open database")
            return
        }
        let createSQL = "CREATE TABLE IF NOT EXISTS FIELDS " +
        "(ROW INTEGER PRIMARY KEY, FIELD_DATA TEXT);"
        var errMsg:UnsafeMutablePointer<Int8>? = nil
        result = sqlite3_exec(database, createSQL, nil, nil, &errMsg)
        if (result != SQLITE_OK) {
            sqlite3_close(database)
            print("Failed to create table")
            return
        }

        let fileURL = self.dataFileURL()
        if (FileManager.default.fileExists(atPath: fileURL.path!)) {
            if let array = NSArray(contentsOf: fileURL as URL) as? [String] {
                for i in 0..<array.count {
                    lineFields[i].text = array[i]
                }
            }

            let data = NSMutableData(contentsOf: fileURL as URL)
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data! as Data)
            let fourLines = unarchiver.decodeObject(forKey: ViewController.rootKey) as! FourLines
            unarchiver.finishDecoding()

            if let newLines = fourLines.lines {
                for i in 0..<newLines.count {
                    lineFields[i].text = newLines[i]
                }
            }


        }

        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self,
                       selector: #selector(self.applicationWillResignActive(notification:)),
                       name: Notification.Name.UIApplicationWillResignActive, object: app)




    }

    func dataFilePath() -> String {
        let urls = FileManager.default.urls(for:
            .documentDirectory, in: .userDomainMask)
        var url:String?

        url = urls.first?.appendingPathComponent("data.plist").path
        return url!
    }

    func applicationWillResignActive(notification:NSNotification) {
        let fileURL = self.dataFileURL()
        let fourLines = FourLines()
        let array = (self.lineFields as NSArray).value(forKey: "text")
            as! [String]
        fourLines.lines = array
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(fourLines, forKey: ViewController.rootKey)
        archiver.finishEncoding()
        data.write(to: fileURL as URL, atomically: true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func dataFileURL() -> NSURL {
        let urls = FileManager.default.urls(for:
            .documentDirectory, in: .userDomainMask)
        var url:NSURL?
        url = URL(fileURLWithPath: "") as NSURL?      // create a blank path
        url = urls.first?.appendingPathComponent("data.archive") as NSURL?
        return url!
    }

}

