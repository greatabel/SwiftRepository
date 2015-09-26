// http://makeapppie.com/tag/uipickerview-in-swift/

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var myLabel: UILabel!

    @IBOutlet weak var myPicker: UIPickerView!
    
    let pickerData = ["Mozzarella","Gorgonzola","Provolone","Brie","Maytag Blue","Sharp Cheddar"
        ,"Monterrey Jack","Stilton","Gouda","Goat Cheese", "Asiago"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myPicker.dataSource = self
        myPicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData,
            attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!
                ,NSForegroundColorAttributeName:UIColor.blueColor()])
        return myTitle
        
    }

    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 36.0
    }

    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 200
    }

    func pickerView(pickerView: UIPickerView, viewForRow row: Int,
        forComponent component: Int, reusingView view: UIView?) -> UIView {
//        let pickerLabel = UILabel()
//        let titleData = pickerData[row]
//        let myTitle = NSAttributedString(string: titleData,
//            attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 26.0)!
//                ,NSForegroundColorAttributeName:UIColor.blackColor()])
//        pickerLabel.attributedText = myTitle
//        return pickerLabel

            //color  and center the label's background


    var pickerLabel = view as! UILabel!
    if view == nil {  //if no label there yet
        pickerLabel = UILabel()
        //color the label's background
        let hue = CGFloat(row)/CGFloat(pickerData.count)
        pickerLabel.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }
            let titleData = pickerData[row]
            let myTitle = NSAttributedString(string: titleData,
                attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 26.0)!,NSForegroundColorAttributeName:UIColor.blackColor()])
            pickerLabel!.attributedText = myTitle
            pickerLabel!.textAlignment = .Center
            return pickerLabel
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myLabel.text = pickerData[row]
    }


}

