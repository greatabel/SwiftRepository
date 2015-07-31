//
//  PeripheralsTableViewController.swift
//  AbelHeadsBluetooth
//
//  Created by 万畅 on 15/7/31.
//  Copyright (c) 2015年 万畅. All rights reserved.
//

import UIKit
import CoreBluetooth

struct Peripheral{
    var peripheral:CBPeripheral
    var name: String?
    var UUID: String
    var RSSI: String
    var connectable = "No"
    
    init(peripheral: CBPeripheral, RSSI: String, advertisementDictionary: NSDictionary){
        self.peripheral = peripheral
        name = peripheral.name ?? "No name."
        UUID = peripheral.identifier.UUIDString
        self.RSSI = RSSI
        if let isConnectable = advertisementDictionary[CBAdvertisementDataIsConnectable] as? NSNumber{
            connectable = (isConnectable.boolValue) ? "Yes": "No"
        }
    }
    
    
}

class PeripheralsTableViewController: UITableViewController,CBCentralManagerDelegate {
    

}
