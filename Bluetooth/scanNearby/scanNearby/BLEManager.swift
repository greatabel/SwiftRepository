//
//  BLEManager.swift
//  scanNearby
//
//  Created by 万畅 on 15/7/30.
//  Copyright (c) 2015年 万畅. All rights reserved.
//

import CoreBluetooth

class BLEManager {
    var centralManager: CBCentralManager!
    var bleHandler : BLEHandler
    
    init(){
        self.bleHandler = BLEHandler()
        self.centralManager = CBCentralManager(delegate: self.bleHandler, queue: nil)
        
    }
}
