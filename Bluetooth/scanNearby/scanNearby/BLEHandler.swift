//
//  BLEHandler.swift
//  scanNearby
//
//  Created by 万畅 on 15/7/30.
//  Copyright (c) 2015年 万畅. All rights reserved.
//


import CoreBluetooth

class BLEHandler: NSObject, CBCentralManagerDelegate {

    override init(){
        super.init()
    }
    
    func centralManagerDidUpdateState(central: CBCentralManager!) {
        switch(central.state){
        case .Unsupported:
            println("BLE is unsupported")
        case .Unauthorized:
            println("BEL is unauthorized")
        case .Unknown:
            println("BLE is unknown")
        case .Resetting:
            println("BLE is resetting")
        case .PoweredOff:
            println("BLE is powered off")
        case .PoweredOn:
            println("BLE is powered on")
        default:
            println("BLE default")
            
        }
    }
    
    func centralManager(central: CBCentralManager!, didDiscoverPeripheral peripheral: CBPeripheral!, advertisementData: [NSObject : AnyObject]!, RSSI: NSNumber!) {
        println("\(peripheral.name): \(RSSI) dBm")
    }
    
}
