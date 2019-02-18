//
//  card.swift
//  concentration
//
//  Created by Justin Zollars on 2/17/19.
//  Copyright © 2019 Justin Zollars. All rights reserved.
//

import Foundation

// The power of protocols 36:50
// Y8ss6118RQY
struct Card: Hashable
{
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    // hashable
    var hashValue: Int { return identifier }
    
    // hashable equatable 
    static func ==(lhs:Card, rhs:Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    static var identifierFactory = 0
    static func getUniqueIdentifier()->Int{
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    init(){
        self.identifier=Card.getUniqueIdentifier()
    }
}
