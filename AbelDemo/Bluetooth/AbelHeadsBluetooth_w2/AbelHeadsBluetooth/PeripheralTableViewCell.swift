//
//  PeripheralTableViewCell.swift
//  AbelHeadsBluetooth
//
//  Created by 万畅 on 15/7/31.
//  Copyright (c) 2015年 万畅. All rights reserved.
//

import UIKit
import CoreBluetooth

class PeripheralTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
   
    @IBOutlet weak var UUIDLabel: UILabel!
    
    @IBOutlet weak var RSSILabel: UILabel!
    
    @IBOutlet weak var connectableLabel: UILabel!
    
    @IBOutlet weak var otherLabel: UILabel!
    
    func setupWithPeripheral(peripheral: Peripheral){
        nameLabel.text = peripheral.name
        UUIDLabel.text = peripheral.UUID
        RSSILabel.text = peripheral.RSSI
        connectableLabel.text = peripheral.connectable
    }
}
