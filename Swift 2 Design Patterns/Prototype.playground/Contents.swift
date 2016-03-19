//: Playground - noun: a place where people can play

import UIKit

class AbstractCard {
    var name: String?
    var mana: Int?
    var attack: Int?
    var defense: Int?
    init(name:String?, mana:Int?, attack:Int?,defense:Int?) {
        self.name = name
        self.attack = attack
        self.defense = defense
        self.mana = mana
    }

    func clone() -> AbstractCard {
        return AbstractCard(name:self.name, mana: self.mana, attack: self.attack, defense: self.defense)
    }
}

class Card: AbstractCard {
    override init(name: String?, mana: Int?, attack: Int?, defense: Int?) {
        super.init(name: name, mana: mana, attack: attack, defense: defense)
    }
}

let raidLeader = Card(name: "Raid Leader", mana: 3, attack: 2, defense: 2)

let facelessManipulator = raidLeader.clone()


print("\(facelessManipulator.name, facelessManipulator.mana, facelessManipulator.attack, facelessManipulator.defense)")
