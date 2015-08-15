//
//  Deck.swift
//  2Memory
//
//  Created by 万畅 on 15/8/15.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import Foundation

enum Suit: CustomStringConvertible{
    case Spades, Hearts, Diamonds, Clubs
    var description: String{
        switch self{
        case .Spades:
            return "spades"
        case .Hearts:
            return "heart"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
        
        
    }
    
}

enum Rank: Int,CustomStringConvertible{
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queue, King
    var description: String {
        switch self{
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queue:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    
}

struct Card: CustomStringConvertible, Equatable{
    private let rank: Rank
    private let suit: Suit
    var description: String {
        return "\(rank.description)_of_\(suit.description)"
    }
    
}

func ==(card1: Card, card2: Card) -> Bool{
    return card1.rank == card2.rank && card1.suit == card2.suit
}

