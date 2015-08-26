//
//  ViewController.swift
//  08Table Cells
//
//  Created by 万畅 on 15/8/26.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
 
    let cellTableIdentifier = "CellTableIdentifier"
    @IBOutlet var tablewView: UITableView!
    
    let computers = [
        ["Name" : "MacBook Air", "Color" : "Silver"],
        ["Name" : "MacBook Pro", "Color" : "Silver"],
        ["Name" : "iMac", "Color" : "Silver"],
        ["Name" : "Mac Mini", "Color" : "Silver"],
        ["Name" : "Mac Pro", "Color" : "Black"]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.

        tablewView.registerClass(NameAndColorCell.self, forCellReuseIdentifier: cellTableIdentifier)
    
   }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return computers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tablewView.dequeueReusableCellWithIdentifier(cellTableIdentifier, forIndexPath: indexPath) as! NameAndColorCell
        let rowData = computers[indexPath.row]
        cell.name = rowData["Name"]!
        cell.color = rowData["Color"]!
        
        return cell
    }
    
    


}

