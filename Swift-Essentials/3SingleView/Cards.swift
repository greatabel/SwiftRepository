//
//  Cards.swift
//  3SingleView
//
//  Created by abel on 15/7/17.
//  Copyright (c) 2015年 greatabel. All rights reserved.
//

enum Suit{
    case Clubs, Diamonds, Hearts
    case Spades
}

enum Rank:Int{
    case Two = 2, Three, Four,Five
    case Six,Seven,Egiht,Nine,Ten
    case Jack,Queen,King,Ace
}
enum Card{
    case Face(Rank,Suit)
    case Joker
}
