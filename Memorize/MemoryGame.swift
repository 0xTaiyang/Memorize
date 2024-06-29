//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Taiyang Lyu on 23/6/2024.
//

import Foundation

struct MemoryGame<CardContent> {
    
    // read-only
    private(set) var cards: [Card] // Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
