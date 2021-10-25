//
//  ViewController.swift
//  Concentration
//
//  Created by coriv🧑🏻‍💻 on 10/25/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2) {
        didSet {
            updateViewFromModel()
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("NIL")
        }
    }
    // Function to update the view, and reflect the most recent model
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
            }
        }
        flipCountLabel.text = "Score: \(game.score)" // Update score
    }
    
    var emojiChoices = Card.themes[Int(arc4random_uniform(UInt32(Card.themes.count)))]
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0  {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex) // after selecting, remove the element at index
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
    // To begin a brand new game, re-init Concentration
    @IBAction func newGame() {
        game = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
        emojiChoices = Card.themes[Int(arc4random_uniform(UInt32(Card.themes.count)))]
        
    }
    

}

