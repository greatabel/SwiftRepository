//
//  TutorialViewController.swift
//  AbelSplit
//
//  Created by abel on 15/3/16.
//  Copyright (c) 2015年 abel. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    
    var tutorialURL : NSURL!
    
    var tutorialButtonItem: UIBarButtonItem!
    
    var publishDate : String!
    
    
    @IBOutlet weak var pubDateButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var webview: UIWebView!
    
    @IBOutlet weak var toolbar: UIToolbar!
    
    @IBAction func showPublishDate(sender: AnyObject) {
        var alertView = UIAlertController(title: "Publish Date", message: publishDate!, preferredStyle: UIAlertControllerStyle.Alert)
        alertView.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alertView, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if tutorialURL != nil {
            let request : NSURLRequest = NSURLRequest(URL:tutorialURL)
            webview.loadRequest(request)
            
            if webview.hidden {
                webview.hidden = false
                toolbar.hidden = false
            }
            
            if self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.Compact{
                toolbar.items?.insert(self.splitViewController!.displayModeButtonItem(), atIndex: 0)
            }
        }
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        webview.hidden = true
        toolbar.hidden = true
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("handleFirstViewControllerDisplayModeChangeWithNotification:"), name: "PrimaryVCDisplayModeChangeNotification", object: nil)
        
        tutorialButtonItem = UIBarButtonItem(title: "Tutorial", style: UIBarButtonItemStyle.Plain, target: self, action: "showTutorialsViewController")
    }
    
    func showTutorialsViewController() {
        splitViewController?.preferredDisplayMode = UISplitViewControllerDisplayMode.AllVisible
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func handleFirstViewControllerDisplayModeChangeWithNotification(notification: NSNotification){
        let displayModeObject = notification.object as? NSNumber
        let nextDisplayMode = displayModeObject?.integerValue
        
        if toolbar.items?.count == 3{
            toolbar.items?.removeAtIndex(0)
        }
        
        if nextDisplayMode == UISplitViewControllerDisplayMode.PrimaryHidden.rawValue {
            toolbar.items?.insert(tutorialButtonItem, atIndex: 0)
        }
        else{
            toolbar.items?.insert(splitViewController!.displayModeButtonItem(), atIndex: 0)
        }
    }
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        if previousTraitCollection?.verticalSizeClass == UIUserInterfaceSizeClass.Compact{
            let firstItem = toolbar.items?[0] as? UIBarButtonItem
            if firstItem?.title == "Tutorials"{
                toolbar.items?.removeAtIndex(0)
            }
        }
        else if previousTraitCollection?.verticalSizeClass == UIUserInterfaceSizeClass.Regular{
            if toolbar.items?.count == 3{
                toolbar.items?.removeAtIndex(0)
            }
            
            if splitViewController?.displayMode == UISplitViewControllerDisplayMode.PrimaryHidden {
                toolbar.items?.insert(tutorialButtonItem, atIndex: 0)
            }
            else{
                toolbar.items?.insert(self.splitViewController!.displayModeButtonItem(), atIndex: 0)
            }
        }
    }
    
}
