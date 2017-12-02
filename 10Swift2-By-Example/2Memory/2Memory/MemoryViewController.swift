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
    private var deck: Deck!
    private var selectedIndexes = Array<NSIndexPath>()
    private var numberOfPairs = 0
    private var score = 0
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
        numberOfPairs = 0
        score = 0
        deck = createDeck(numCardsNeededDifficulty(difficulty))
        
        collectionView.reloadData()
    }
    private func createDeck(numCards: Int) -> Deck{
        let fullDeck = Deck.full().shuffled()
        let halfDeck = fullDeck.deckOfNumberOfCards(numCards)
        return (halfDeck + halfDeck).shuffled()
    }
    
}

extension MemoryViewController: UICollectionViewDataSource{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deck.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cardCell", forIndexPath: indexPath) as! CardCell
        
        let card = deck[indexPath.row]
        cell.renderCardName(card.description, backImageName: "back")
        
        return cell
    }
}

// MARK: UICollectionViewDelegate
extension MemoryViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        // http://stackoverflow.com/questions/30730387/swift-2-0-enumerate-is-unavailable-call-the-enumerate-method-on-the-seq
        
        if selectedIndexes.count == 2 || selectedIndexes.contains(indexPath) {
            return
        }
        selectedIndexes.append(indexPath)
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! CardCell
        cell.upturn()
        
        if selectedIndexes.count < 2 {
            return
        }
        
        let card1 = deck[selectedIndexes[0].row]
        let card2 = deck[selectedIndexes[1].row]
        
        if card1 == card2 {
            numberOfPairs++
            checkIfFinished()
            removeCards()
        } else {
            score++
            turnCardsFaceDown()
        }
    }
}

private extension MemoryViewController{
    func checkIfFinished(){
        if numberOfPairs == deck.count / 2{
                showFinalPopUp()
        }
    }
    
    func showFinalPopUp() {
        let alert = UIAlertController(title: "Great!",
            message: "Abel says uou won with score: \(score)!",
            preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
            self.dismissViewControllerAnimated(true, completion: nil)
            return
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func removeCards(){
        execAfter(1.0) {
            self.removeCardsAtPlaces(self.selectedIndexes)
            self.selectedIndexes = Array<NSIndexPath>()
        }
    }
    
    func turnCardsFaceDown(){
        execAfter(2.0) {
            self.downturnCardsAtPlaces(self.selectedIndexes)
            self.selectedIndexes = Array<NSIndexPath>()
        }
    }
    
    func removeCardsAtPlaces(places: Array<NSIndexPath>){
        for index in selectedIndexes {
            let cardCell = collectionView.cellForItemAtIndexPath(index) as! CardCell
            cardCell.remove()
        }
    }
    
    func downturnCardsAtPlaces(places: Array<NSIndexPath>){
        for index in selectedIndexes {
            let cardCell = collectionView.cellForItemAtIndexPath(index)as! CardCell
            cardCell.downturn()
        }
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
    
    func numCardsNeededDifficulty(difficulty: Difficulty) -> Int {
        let (columns, rows) = sizeDifficulty(difficulty)
        return Int(columns * rows / 2)
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
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.scrollEnabled = false
        collectionView.registerClass(CardCell.self, forCellWithReuseIdentifier: "cardCell")
        collectionView.backgroundColor = UIColor.clearColor()
        
        self.view.addSubview(collectionView)
        
        
    }
    
}