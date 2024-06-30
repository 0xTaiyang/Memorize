//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Taiyang Lyu on 23/6/2024.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    // read-only
    private(set) var cards: [Card] // Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add (numberOfPairsOfCards * 2) Cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get { return cards.indices.filter{ index in cards[index].isFaceUp}.only }
        set { return cards.indices.forEach{ cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}){
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else {
                    indexOfOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }

    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var debugDescription: String {
            return "\(id): \(content) \(isFaceUp ? "up": "down")\(isMatched ? "matched": "")"
        }
          
        var isFaceUp = false
        var isMatched: Bool = false
        let content: CardContent
        
        var id: String
    }
}

extension Array {
    var only: Element? {
        return count == 1 ? first : nil
    }
}
