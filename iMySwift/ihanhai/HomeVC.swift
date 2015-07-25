//
//  HomeVC.swift
//  ihanhai
//
//  Created by liwei on 15/4/29.
//  Copyright (c) 2015年 abel. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var myflagButton: UIButton!

    @IBOutlet weak var usernameLabel: UILabel!
    
//    @IBOutlet weak var myuserWebView: UIWebView!
    
    //---------begin table view-------
    //test branch
    var myitems = ["我的项目","我的投资","我的收藏","我的评论","我的私信","修改密码","服务评价"]

     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return myitems.count
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
        
        // Configure the cell...
        var country = myitems[indexPath.row]
        
        cell.textLabel!.text = country
        
//                cell.accessoryType = .Checkmark
        cell.accessoryType = .DisclosureIndicator
        return cell
    }
        //---------end table view-------

    
    
    @IBAction func logoutTapped(sender: UIButton) {
    //触发登出
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        
        self.performSegueWithIdentifier("goto_login", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let path = NSBundle.mainBundle().pathForResource("u_center", ofType: "html", inDirectory: "/www")
//        var requestURL = NSURL(string:path!);
//        var request = NSURLRequest(URL:requestURL!);
        
       
//        myuserWebView.loadRequest(request)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
        if (isLoggedIn != 1) {
//            self.performSegueWithIdentifier("goto_login", sender: self)
            myflagButton.setTitle("登陆", forState: UIControlState.Normal)
        } else {
            self.usernameLabel.text = prefs.valueForKey("USERNAME") as! NSString as String
            myflagButton.setTitle("登出", forState: UIControlState.Normal)

        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
}
