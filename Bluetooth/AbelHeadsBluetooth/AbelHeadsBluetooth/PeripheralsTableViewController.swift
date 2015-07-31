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
    
    var manager: CBCentralManager!
    var isBluetoothEnabled = false
    var visiblePeripheralUUIDs = NSMutableOrderedSet()
    var visiblePeripherals = [String: Peripheral]()
    var scanTimer: NSTimer?
    var connectionAttemptTimer:NSTimer?
    var connectedPeripheral: CBPeripheral?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 134
        
       self.refreshControl?.addTarget(self, action: Selector("startScanning"), forControlEvents: .ValueChanged)
        
    }
    
    func startScanning(){
        println("Started scanning");
        
    }
    
    func centralManagerDidUpdateState(central: CBCentralManager!) {
        
    }
    
    func centralManager(central: CBCentralManager!, didConnectPeripheral peripheral: CBPeripheral!) {
        
    }
    
    func centralManager(central: CBCentralManager!, didDiscoverPeripheral peripheral: CBPeripheral!, advertisementData: [NSObject : AnyObject]!, RSSI: NSNumber!) {
        
    }
    
    func centralManager(central: CBCentralManager!, didDisconnectPeripheral peripheral: CBPeripheral!, error: NSError!) {
        
    }
    func centralManager(central: CBCentralManager!, didFailToConnectPeripheral peripheral: CBPeripheral!, error: NSError!) {
        
    }

}
