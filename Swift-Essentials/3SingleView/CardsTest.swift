//
//  CardsTest.swift
//  3SingleView
//
//  Created by abel on 15/7/17.
//  Copyright (c) 2015年 greatabel. All rights reserved.
//

import XCTest

class CardsTest: XCTestCase{
    
    func testSuit(){
        var suit_clubs:Suit = Suit.Clubs
        var clubs:Suit = .Clubs
        XCTAssertEqual(suit_clubs,clubs,"Clubs are equal")

    }
    
    func testRank() {
        XCTAssertEqual(Rank.Two.rawValue,2,"Rank.Two.rawValue == 2")
        XCTAssertEqual(Rank(rawValue: 14)!,Rank.Ace,"Rank(rawValue:14)! ==  Rank.Ace")
    }
    
    func testCard() {
        var aceOfSpades:Card = .Face(.Ace,.Spades)
        var theJoker:Card = .Joker
        
        var jokerSeen = false;
        var aceOfSpadesSeen = false;
        
        for card in [aceOfSpades,theJoker] {
            switch(card) {
            case .Face(.Ace,.Spades): aceOfSpadesSeen = true
            case .Face(var rank, var suit): XCTFail("Saw a card \(rank) of \(suit)")
            case .Joker: jokerSeen = true
            }
        }
    }
    
}
