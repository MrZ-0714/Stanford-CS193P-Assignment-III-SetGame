//
//  Cards.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/13/21.
//

import Foundation

struct SetGame<CardContent> {
    private(set) var cards: Array<Card>
    var chosenCards: Array<Card> = []
    var numberOfSetsDiscovered: Int = 0
    
    mutating func choose(card: Card) {
        print("Chosen card: \(card)")
        chosenCards.append(card)
    }
    
    init(numberOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for id in 0...numberOfCards - 1 {
            let content: CardContent = cardContentFactory(id)
            cards.append(Card(id: id, content: content))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        var content: CardContent
        var isSelected: Bool = false
        var isInASet: Bool = false
    }
}
