//
//  TableViewController.swift
//  PullToRefresh
//
//  Created by 万畅 on 15/7/31.
//  Copyright (c) 2015年 万畅. All rights reserved.
//

import UIKit

var alphabet = ["A","B","C","D","E","F","G","H","I","J","K"]

var isAscending = true

class TableViewController: UITableViewController {

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alphabet.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = alphabet[indexPath.row]
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: Selector("sortArray"), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = refreshControl
    }
    
    func sortArray(){
        var sortedAlphabet = alphabet.reverse()
        
        for ( index, element) in enumerate(sortedAlphabet){
            alphabet[index] = element
        }
        
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    
}
