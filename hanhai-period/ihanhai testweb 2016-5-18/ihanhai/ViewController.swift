//
//  ViewController.swift
//  ihanhai
//
//  Created by abel on 15/4/8.
//  Copyright (c) 2015年 abel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let requestURL = NSURL(string:url)
        
//        let request = NSURLRequest(URL: requestURL!)
//        let request = NSURLRequest(URL: try6!)
//        webView.loadRequest(request)
        
        //load www folder into the index tab
        
        
//        let contentSize:CGSize = webView.scrollView.contentSize
//        let viewSize:CGSize = self.view.bounds.size
//        
//        let rw = viewSize.width / contentSize.width
//        
//        webView.scrollView.minimumZoomScale = rw
//        webView.scrollView.maximumZoomScale = rw
//        webView.scrollView.zoomScale = rw
//        
//        
//        
//        
//        webView.scalesPageToFit = true
//        webView.contentMode = UIViewContentMode.ScaleAspectFit
        
        var path = NSBundle.mainBundle().pathForResource("index", ofType: "html", inDirectory: "/www")
//        path = "http://139.224.73.50/"
        let requestURL = NSURL(string:path!);
        let request = NSURLRequest(URL:requestURL!);
        
        
        webView.loadRequest(request)
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

