//
//  ViewController.swift
//  PickerView
//
//  Created by 万畅 on 15/9/26.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import UIKit



class ViewController: UIViewController ,UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var myLabel: UILabel!

    @IBOutlet weak var myPicker: UIPickerView!

    enum PickerComponent:Int{
        case size = 0
        case topping = 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myPicker.delegate = self
        myPicker.dataSource = self
        myPicker.selectRow(2, inComponent: PickerComponent.size.rawValue, animated: false)
        updateLabel()
    }

    let pickerData = [
        ["10\"","20\"","30\"","40\""],
        ["Cheese", "Pepperoni", "Sausage","Veggie","BBQ Chicken"]
    ]

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerData.count
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateLabel()
    }

    func updateLabel(){
//        let size = pickerData[0][myPicker.selectedRowInComponent(0)]
//        let topping = pickerData[1][myPicker.selectedRowInComponent(1)]
//        myLabel.text = "Pizza: " + size + " " + topping
        var sizeComponent = PickerComponent.size.rawValue
        let toppingComponent = PickerComponent.topping.rawValue
        let size = pickerData[sizeComponent][myPicker.selectedRowInComponent(sizeComponent)]
        let topping = pickerData[toppingComponent][myPicker.selectedRowInComponent(toppingComponent)]
        myLabel.text = "Pizza: " + size + " " + topping
    }


}

