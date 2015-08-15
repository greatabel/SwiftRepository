//
//  MemoryViewController.swift
//  2Memory
//
//  Created by 万畅 on 15/8/15.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import UIKit

class MemoryViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private let difficulty: Difficulty
    
    init(difficulty: Difficulty){
            self.difficulty = difficulty
            super.init(nibName:nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit{
        print("deint")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        start()
    }
    
    private func start(){
        
    }
    
}

private extension MemoryViewController{
    func sizeDifficulty(difficulty: Difficulty) -> (CGFloat, CGFloat){
        switch difficulty{
        case .Easy:
            return (4,3)
        case .Medium:
            return (6,4)
        case .Hard:
            return (8,4)
            
        }
    }
}

// MARK: setup
private extension MemoryViewController{
    func setup(){
        view.backgroundColor = UIColor.greenSea()
        
        let ratio: CGFloat = 1.452
        let space: CGFloat = 5
        
        let (columns, rows) = sizeDifficulty(difficulty)
        let cardHeight: CGFloat = view.frame.height/rows - 2*space
        let cardWidth: CGFloat = cardHeight/ratio
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        layout.itemSize = CGSize(width: cardWidth, height: cardHeight)
        layout.minimumLineSpacing = space
        
        let covWidth = columns*(cardWidth + 2*space)
        let covHeight = rows*(cardHeight + space)
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: covWidth, height: covHeight), collectionViewLayout: layout)
        collectionView.center = view.center
//        collectionView.dataSource = self
//        collectionView.delegate = self
        collectionView.scrollEnabled = false
//        collectionView.registerClass(CardCell.self, forCellWithReuseIdentifier: "cardCell")
        collectionView.backgroundColor = UIColor.clearColor()
        
        self.view.addSubview(collectionView)
        
        
    }
    
}