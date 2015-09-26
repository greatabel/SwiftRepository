//
//  ViewController.swift
//  SwiftUIPickerFormatted
//
//  Created by 万畅 on 15/9/26.
//  Copyright © 2015年 abelwan. All rights reserved.
//

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

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myLabel.text = pickerData[row]
    }


}

