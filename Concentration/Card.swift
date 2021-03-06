//
//  Card.swift
//  Concentration
//
//  Created by corivπ§π»βπ» on 10/25/21.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var isSeen = 0
    var identifier: Int
    
    static var identifierFactory = 0
    
    static var themes = [animals,sports,faces]
    
    static var animals = ["πΌ","π±","π­","π΅","π€"]
    static var sports = ["β½οΈ","π","π","βΎοΈ","π₯"]
    static var faces = ["π","π","π","π€¬","π₯΅"]
    
    
    static func getUniqeIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    init() {
        self.identifier = Card.getUniqeIdentifier()
    }
}
