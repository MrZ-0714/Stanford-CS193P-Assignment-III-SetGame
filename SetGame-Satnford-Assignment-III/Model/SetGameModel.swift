//
//  Cards.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/13/21.
//

import Foundation

struct SetGameModel<CardContent> {
    private(set) var cards: Array<Card>
    var chosenCards: Array<Card> = []
    var numberOfSetsDiscovered: Int = 0
    
    mutating func choose(card: Card) {
        print("Chosen card: \(card)")
        
        let i: Int = cards.firstIndex(matching: card)!
        if (!card.isSelected) {
            cards[i].isSelected = !cards[i].isSelected
            chosenCards.append(card)
        } else {
            cards[i].isSelected = !cards[i].isSelected
            
        }
    }
    
    init(numberOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for id in 0..<numberOfCards {
            let content: CardContent = cardContentFactory(id)
            cards.append(Card(id: id, content: content))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isSelected: Bool = false
        var isInASet: Bool = false
        var isFaceUp: Bool = false
        var content: CardContent
    }
}
