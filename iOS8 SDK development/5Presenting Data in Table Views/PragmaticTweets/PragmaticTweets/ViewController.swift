//
//  ViewController.swift
//  PragmaticTweets
//
//  Created by 万畅 on 16/3/17.
//  Copyright © 2016年 abelwan. All rights reserved.
//

import UIKit

public class ViewController: UITableViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }

    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section + 1
    }

    override public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }

    override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel!.text = "Row \(indexPath.row)"
        return cell
    }




}

