//
//  PeripheralViewController.swift
//  AbelHeadsBluetooth
//
//  Created by 万畅 on 15/7/31.
//  Copyright (c) 2015年 万畅. All rights reserved.
//

import UIKit
import Foundation
import CoreBluetooth


class PeripheralViewController : UIViewController, CBPeripheralDelegate, UITableViewDataSource
{
    var dataStr = ""
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var UUIDLabel: UILabel!
    
    @IBOutlet weak var RSSILabel: UILabel!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var peripheral: CBPeripheral!
    
    override func viewDidLoad() {
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        
        print("Peripheral: \(peripheral)")
        
        nameLabel.text = peripheral.name ?? "No Name"
        UUIDLabel.text = peripheral.identifier.UUIDString
        RSSILabel.text = "\(peripheral.RSSI)"
        
        peripheral.delegate = self
        peripheral.readRSSI()
        peripheral.discoverServices(nil)
    }
    
    func peripheral(peripheral: CBPeripheral, didDiscoverServices error: NSError?) {
        print("Did discover services.")
        if let error = error {
            print(error)
        }
        else {
            print("\(peripheral.services)")
            tableView.reloadData()
        }
        
        print("## find service= \(peripheral.services?.count) # \(peripheral.services)")
                for service in peripheral.services! {
                    if service.UUID.description == "FFF0" {
                        peripheral.discoverCharacteristics(nil, forService: (service as CBService))
                    }
                }
    }
    // to handle characteristic discovery, like say, for the battery of a FitBit Flex.
        func peripheral(peripheral: CBPeripheral!, didDiscoverCharacteristicsForService service: CBService!, error: NSError!) {
            let characteristic = service.characteristics![5] as CBCharacteristic
            print("@@@@\n @@@ \(characteristic)")
            peripheral.readValueForCharacteristic(characteristic)
            peripheral.setNotifyValue(true, forCharacteristic: characteristic)
        }
    
     // you want to recieve updates for a characteristic, like say, the battery for a FitBit Flex.
        func peripheral(peripheral: CBPeripheral!, didUpdateValueForCharacteristic characteristic: CBCharacteristic!, error: NSError!) {
            if let error = error {
                print("Failed to updated value for characteristic with error: \(error)")
            }
            else {
//                print("Sun's data: \(characteristic.value)")
                
                do{
                   
                    if(characteristic.value != nil){
                        var convertedString = try NSString(data:characteristic.value!, encoding:NSUTF8StringEncoding) as! String
                        dataStr = dataStr + convertedString
                        print("### \(dataStr)")
                    }
                    
                    
                }catch let unknownError {
                    print("\(unknownError) is an unknown error.")
                    
                }
                
                
             
            }
        }
   
    
    func peripheralDidUpdateRSSI(peripheral: CBPeripheral!, error: NSError!) {
        print("Did update RSSI.")
        if let error = error {
            print("Error getting RSSI: \(error)")
            RSSILabel.text = "Error getting RSSI."
        }
        else {
            RSSILabel.text = "\(peripheral.RSSI)"
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ServiceCell", forIndexPath: indexPath)
        let service = peripheral.services![indexPath.row] as CBService
        
        print("Service UUID Desc: \(service.UUID.description)")
        cell.textLabel?.text = service.UUID.description
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peripheral.services?.count ?? 0
    }
    
    
    
}
