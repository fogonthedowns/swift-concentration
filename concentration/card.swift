//
//  card.swift
//  concentration
//
//  Created by Justin Zollars on 2/17/19.
//  Copyright © 2019 Justin Zollars. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    static func getUniqueIdentifier()->Int{
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    init(){
        self.identifier=Card.getUniqueIdentifier()
    }
}
