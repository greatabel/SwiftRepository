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


class PeripheralViewController : UIViewController
{
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var UUIDLabel: UILabel!
    
    @IBOutlet weak var RSSILabel: UILabel!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var peripheral: CBPeripheral!
    
    override func viewDidLoad() {

    }
    
     override func viewDidAppear(animated: Bool) {
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ServiceCell", forIndexPath: indexPath) as! UITableViewCell
        let service = peripheral.services![indexPath.row] as CBService
        
        print("Service UUID Desc: \(service.UUID.description)")
        cell.textLabel?.text = service.UUID.description
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peripheral.services?.count ?? 0
    }
    
     

}
