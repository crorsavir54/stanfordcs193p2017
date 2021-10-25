//
//  Card.swift
//  Concentration
//
//  Created by coriv🧑🏻‍💻 on 10/25/21.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var isSeen = 0
    var identifier: Int
    
    static var identifierFactory = 0
    
    static var themes = [animals,sports,faces]
    
    static var animals = ["🐼","🐱","🐭","🐵","🐤"]
    static var sports = ["⚽️","🏀","🏈","⚾️","🥎"]
    static var faces = ["😍","😃","😁","🤬","🥵"]
    
    
    static func getUniqeIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    init() {
        self.identifier = Card.getUniqeIdentifier()
    }
}
