//
//  ViewController.swift
//  concentration
//
//  Created by Justin Zollars on 2/16/19.
//  Copyright © 2019 Justin Zollars. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // will not init() until used
    lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards )
    
    var numberOfPairsOfCards: Int {
        get {
            return (cardButtons.count+1)/2
        }
    }
    
    var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flip Count: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
          print("cardNumber = \(cardNumber)")
          game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }

    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for:
                    UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emojiChoices: String = "🦄🚀👠🥽🎩🦞🐕"
    private var emoji = Dictionary<Card,String>()
    private func emoji(for card: Card) -> String {
        // nested ifs can be cleaned up with a ",". The following has two conditions in one
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
              emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        
        // equivalent to the following
        // if chosenEmoji = emoji[card] != nil {
        //   return chosenEmoji
        // } else {
        //   return "?"
        // }
        return emoji[card] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
      if self > 0 {
        return Int(arc4random_uniform(UInt32(self)))
      } else if self < 0 {
        return -Int(arc4random_uniform(UInt32(abs(self))))
      } else {
        return 0
      }
    }
}
