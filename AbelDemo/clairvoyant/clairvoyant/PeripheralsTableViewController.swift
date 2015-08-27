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
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        manager = CBCentralManager(delegate: self, queue: nil, options: [CBCentralManagerOptionShowPowerAlertKey: true])
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        manager = CBCentralManager(delegate: self, queue: nil, options: [CBCentralManagerOptionShowPowerAlertKey: true])
    }
    
    //    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    //        return UITableViewAutomaticDimension
    //    }
    //
    //    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    //        return UITableViewAutomaticDimension
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 134
        
        
        //  http://stackoverflow.com/questions/30299319/why-uitableviewautomaticdimension-not-working
        tableView.rowHeight =   134 // UITableViewAutomaticDimension
        print("UITableViewAutomaticDimension= \(UITableViewAutomaticDimension) ")
        
        self.refreshControl?.addTarget(self, action: Selector("startScanning"), forControlEvents: .ValueChanged)
        
    }
    
    
    
    func startScanning() {
        print("Started scanning.")
        visiblePeripheralUUIDs.removeAllObjects()
        visiblePeripherals.removeAll(keepCapacity: true)
        tableView.reloadData()
        manager.scanForPeripheralsWithServices(nil, options: nil)
        scanTimer = NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: Selector("stopScanning"), userInfo: nil, repeats: false)
    }
    
    func stopScanning(){
        print("Stopped Scanning")
        print("Found \(visiblePeripherals.count) peripherals.")
        manager.stopScan()
        refreshControl?.endRefreshing()
        scanTimer?.invalidate()
    }
    
    func centralManagerDidUpdateState(central: CBCentralManager) {
        var printString: String
        switch central.state {
        case .PoweredOff:
            printString = "Bluetooth hardware powered off."
            isBluetoothEnabled = false
        case .PoweredOn:
            printString = "Bluetooth hardware powered on."
            isBluetoothEnabled = true
            startScanning()
        case .Resetting:
            printString = "Bluetooth hardware is resetting."
            isBluetoothEnabled = false
        case .Unauthorized:
            printString = "Bluetooth hardware is unauthorized."
            isBluetoothEnabled = false
        case .Unsupported:
            printString = "Bluetooth hardware is unsupported."
            isBluetoothEnabled = false
        case .Unknown:
            printString = "Bluetooth hardware state is unknown."
            isBluetoothEnabled = false
        }
        
        print("State updated to: \(printString)")
        
    }
    
    func centralManager(central: CBCentralManager, didConnectPeripheral peripheral: CBPeripheral) {
        print("Peripheral connected: \(peripheral.name ?? peripheral.identifier.UUIDString)")
        connectionAttemptTimer?.invalidate()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let peripheralViewController = storyboard.instantiateViewControllerWithIdentifier("PeripheralViewController") as! PeripheralViewController
        peripheralViewController.peripheral = peripheral
        navigationController?.pushViewController(peripheralViewController, animated: true)
    }
    
    func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        
        print("Peripheral found with name: \(peripheral.name)\nUUID: \(peripheral.identifier.UUIDString)\nRSSI: \(RSSI)\nAdvertisement Data: \(advertisementData)")
        
        visiblePeripheralUUIDs.addObject(peripheral.identifier.UUIDString)
        visiblePeripherals[peripheral.identifier.UUIDString] = Peripheral(peripheral: peripheral, RSSI: RSSI.stringValue, advertisementDictionary: advertisementData)
        
        tableView.reloadData()
    }
    
    //    func centralManager(central: CBCentralManager!, didDiscoverPeripheral peripheral: CBPeripheral!, advertisementData: [NSObject : AnyObject]!, RSSI: NSNumber!) {
    //
    //         print("Peripheral found with name: \(peripheral.name)\nUUID: \(peripheral.identifier.UUIDString)\nRSSI: \(RSSI)\nAdvertisement Data: \(advertisementData)")
    //
    //        visiblePeripheralUUIDs.addObject(peripheral.identifier.UUIDString)
    //        visiblePeripherals[peripheral.identifier.UUIDString] = Peripheral(peripheral: peripheral, RSSI: RSSI.stringValue, advertisementDictionary: advertisementData)
    //
    //        tableView.reloadData()
    //    }
    
    func centralManager(central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: NSError?) {
        
    }
    func centralManager(central: CBCentralManager, didFailToConnectPeripheral peripheral: CBPeripheral, error: NSError?) {
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visiblePeripherals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("PeripheralCell", forIndexPath: indexPath) as! PeripheralTableViewCell
        
        if let visibleUUID = visiblePeripheralUUIDs[indexPath.row] as? String{
            if let visiblePeripheral = visiblePeripherals[visibleUUID] {
                if visiblePeripheral.connectable == "No"{
                    cell.accessoryType = .None
                }
                cell.setupWithPeripheral(visiblePeripheral)
            }
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let selectedUUID = visiblePeripheralUUIDs[indexPath.row] as? String {
            if let selectedPeripheral = visiblePeripherals[selectedUUID] {
                if selectedPeripheral.connectable == "Yes" {
                    connectedPeripheral = selectedPeripheral.peripheral
                    connectionAttemptTimer = NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: Selector("timeoutPeripheralConnectionAttempt"), userInfo: nil, repeats: false)
                    manager.connectPeripheral(connectedPeripheral!, options: nil)
                }
            }
        }
    }
    
}
