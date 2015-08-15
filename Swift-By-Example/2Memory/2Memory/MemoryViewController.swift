//
//  MemoryViewController.swift
//  2Memory
//
//  Created by 万畅 on 15/8/15.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import UIKit

class MemoryViewController: UIViewController {
    
    private let difficulty: Difficulty
    
    init(difficulty: Difficulty){
            self.difficulty = difficulty
            super.init(nibName:nil, bundle: nil)
    }
    required init(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
}
