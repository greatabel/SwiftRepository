import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var myimage: UIImageView!

    var fullRes = [FullRes]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func load(sender: AnyObject) {
        myimage.image = UIImage(named: "testimage")
    }

    @IBAction func saveFunc(sender: AnyObject) {
        print("in saveFunc")
        let image = UIImage(named: "testimage")
        print(image!.size)
        let imageData = UIImageJPEGRepresentation(image!, 1)

        CoreDataStack.sharedInstance.loadData()
        fullRes = CoreDataStack.sharedInstance.fullRes
        print("fullRes", fullRes)
        print("count=", fullRes.count)
        saveUser(imageData!)



    }

    func saveUser(imageData: NSData) {
        let a = NSEntityDescription.insertNewObjectForEntityForName("FullRes",
            inManagedObjectContext: CoreDataStack.sharedInstance.context) as? FullRes
        if let a = a {
            a.imageData = imageData
            do {
                try CoreDataStack.sharedInstance.context.save()
                fullRes.append(a)
                CoreDataStack.sharedInstance.loadData()
            } catch let unknownError {
                print("save patient error \(unknownError) is an unknown error.")
            }
        }
    }

}

