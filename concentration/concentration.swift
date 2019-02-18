//
//  concentration.swift
//  concentration
//
//  Created by Justin Zollars on 2/17/19.
//  Copyright © 2019 Justin Zollars. All rights reserved.
//

import Foundation

struct Concentration
{
    
    var cards = [Card]()
    
    // an optional Type makes our work easy
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index:Int){
        if !cards[index].isMatched {
            // matchedIndex ensures you arent clicking on the same card
            if let matchedIndex = indexOfOneAndOnlyFaceUpCard, matchedIndex != index {
               // check if cards match
                if cards[matchedIndex].identifier == cards[index].identifier {
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards:Int){
        // coutable range
        // 0..< to up to not inlcuding number of pairs of cards
        // 0... meanings including
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            // when you pass a struct to another variable
            // you are copies them
            // asigning to a new var makes a new copy
            cards += [card,card]
            //TODO shuffle cards
            cards.shuffle()
        }
       
    }
}
