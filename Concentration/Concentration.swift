//
//  Concentration.swift
//  Concentration
//
//  Created by coriv🧑🏻‍💻 on 10/25/21.
//

import Foundation


class Concentration {
    var cards = [Card]()
    var score = 0
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Check if cards matched
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2 // Give two points for every match
                }
                else if cards[matchIndex].isSeen > 1 || cards[index].isSeen > 1{
                    score -= 1
                }
                cards[index].isFaceUp = true
                cards[index].isSeen += 1
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // If there are two cards faceUp
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                // One card open, set index of one and only
                cards[index].isFaceUp = true
                cards[index].isSeen += 1
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        print(cards[index])
    }
    
    init(numberOfPairsOfCards: Int) {
        
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        // Shuffle cards after initializing cards []
        cards.shuffle()
    }
}
