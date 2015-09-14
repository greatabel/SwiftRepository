//
//  ViewController.swift
//  testSwift2version
//
//  Created by 万畅 on 15/8/7.
//  Copyright © 2015年 万畅. All rights reserved.
//

//import UIKit
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        let letters: [Character] = ["c", "a", "f", "e"]
//        var string: String = String(letters)
//        
//        print(letters.count) // 4
//        print(string) // cafe
//        print(string.characters.count) // 4
//        
//        let acuteAccent: Character = "\u{0301}" // ´ COMBINING ACUTE ACCENT' (U+0301)
//        
//        string.append(acuteAccent)
//        print(string.characters.count) // 4
//        print(string.characters.last!) // é
//        do{
//            print("Hello")
//            print("Hello", terminator: "")
//        }
//        catch
//        {
//            print("error here")
//        }
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//        
//    }
//
//
//}

// igistarters.com/swift-charting-library-jbchartview/
// https://github.com/Jawbone/JBChartView

import UIKit

class ViewController: UIViewController, JBBarChartViewDelegate, JBBarChartViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        let barChartView = JBBarChartView();
        barChartView.dataSource = self;
        barChartView.delegate = self;
        barChartView.backgroundColor = UIColor.darkGrayColor();
        barChartView.frame = CGRectMake(0, 20, self.view.bounds.width, self.view.bounds.height * 0.5);
        barChartView.reloadData();
        self.view.addSubview(barChartView);
        print("Launched");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfBarsInBarChartView(barChartView: JBBarChartView!) -> UInt {
        print("numberOfBarsInBarChartView");
        return 10 //number of lines in chart
    }

    func barChartView(barChartView: JBBarChartView, heightForBarViewAtIndex index: UInt) -> CGFloat {
        print("barChartView", index);
        
        return CGFloat(arc4random_uniform(100));
    }
    
}

