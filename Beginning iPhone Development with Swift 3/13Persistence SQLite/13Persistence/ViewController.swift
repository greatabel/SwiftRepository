import UIKit

extension String {
    public init?(validatingUTF8 cString: UnsafePointer<UInt8>) {
        guard let (s, _) = String.decodeCString(cString, as: UTF8.self,
                                                repairingInvalidCodeUnits: false) else {
                                                    return nil
        }
        self = s
    }
}

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
        let query = "SELECT ROW, FIELD_DATA FROM FIELDS ORDER BY ROW"
        var statement:OpaquePointer? = nil
        if sqlite3_prepare_v2(database, query, -1, &statement, nil) == SQLITE_OK {
            while sqlite3_step(statement) == SQLITE_ROW {
                let row = Int(sqlite3_column_int(statement, 0))
                let rowData = sqlite3_column_text(statement, 1)
//                let fieldValue = String.init(cString: UnsafePointer<CChar>(rowData!))
//                lineFields[row].text = fieldValue
// https://stackoverflow.com/questions/25168030/issue-with-unsafepointeruint8-in-sqlite-project-in-swift
                let value = String(cString: rowData!)
                lineFields[row].text = value
            }
            sqlite3_finalize(statement)
        }

//        let fileURL = self.dataFileURL()
//        if (FileManager.default.fileExists(atPath: fileURL.path!)) {
//            if let array = NSArray(contentsOf: fileURL as URL) as? [String] {
//                for i in 0..<array.count {
//                    lineFields[i].text = array[i]
//                }
//            }
//
//            let data = NSMutableData(contentsOf: fileURL as URL)
//            let unarchiver = NSKeyedUnarchiver(forReadingWith: data! as Data)
//            let fourLines = unarchiver.decodeObject(forKey: ViewController.rootKey) as! FourLines
//            unarchiver.finishDecoding()
//
//            if let newLines = fourLines.lines {
//                for i in 0..<newLines.count {
//                    lineFields[i].text = newLines[i]
//                }
//            }
//
//
//        }

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

//    func applicationWillResignActive(notification:NSNotification) {
//        let fileURL = self.dataFileURL()
//        let fourLines = FourLines()
//        let array = (self.lineFields as NSArray).value(forKey: "text")
//            as! [String]
//        fourLines.lines = array
//        let data = NSMutableData()
//        let archiver = NSKeyedArchiver(forWritingWith: data)
//        archiver.encode(fourLines, forKey: ViewController.rootKey)
//        archiver.finishEncoding()
//        data.write(to: fileURL as URL, atomically: true)
//    }
    func applicationWillResignActive(notification:NSNotification) {
        var database:OpaquePointer? = nil
        let result = sqlite3_open(dataFilePath(), &database)
        if result != SQLITE_OK {
            sqlite3_close(database)
            print("Failed to open database")
            return
        }
        for i in 0..<lineFields.count  {
            let field = lineFields[i]
            let update = "INSERT OR REPLACE INTO FIELDS (ROW, FIELD_DATA) " +
            "VALUES (?, ?);"
            var statement:OpaquePointer? = nil
            if sqlite3_prepare_v2(database, update, -1, &statement, nil) == SQLITE_OK {
                let text = field.text
                sqlite3_bind_int(statement, 1, Int32(i))
                sqlite3_bind_text(statement, 2, text!, -1, nil)
            }
            if sqlite3_step(statement) != SQLITE_DONE {
                print("Error updating table")
                sqlite3_close(database)
                return
            }
            sqlite3_finalize(statement)
        }
        sqlite3_close(database)
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

