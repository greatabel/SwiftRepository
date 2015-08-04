//
//  ViewController.swift
//  testSwift2
//
//  Created by 万畅 on 15/8/4.
//  Copyright © 2015年 万畅. All rights reserved.
// https://developer.apple.com/swift/blog/?id=30

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var letters: [Character] = ["c", "a", "f", "e"]
        var string: String = String(letters)
        
        print(letters.count) // 4
        print(string) // cafe
        print(string.characters.count) // 4
        
        let acuteAccent: Character = "\u{0301}" // ´ COMBINING ACUTE ACCENT' (U+0301)
        
        string.append(acuteAccent)
        print(string.characters.count) // 4
        print(string.characters.last!) // é
        do{
          print("Hello")
          print("Hello", appendNewline: false)
        }catch{
            print("error here")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

