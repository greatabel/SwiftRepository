import UIKit

class DatePickerViewController: UIViewController{

    @IBOutlet var datePicker: UIDatePicker!

    var originalDate: Date! {
        didSet {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"
            let strDate = dateFormatter.string(from: originalDate)

            navigationItem.title = "original date:\(strDate)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        datePicker.date = originalDate
    }

}

