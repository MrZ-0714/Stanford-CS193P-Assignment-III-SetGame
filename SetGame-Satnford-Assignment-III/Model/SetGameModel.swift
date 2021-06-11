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
        // Print the chosen card.
        print("Chosen card: \(card)")
        // Determine if the seleced card is already selected or not
        if (cards[card.id].isSelected) {
            // If so, toggle selection and remove the card from chosenCards
            cards[card.id].toggleSelection()
            chosenCards.remove(at: chosenCards.firstIndex(matching: card)!)
        } else {
            // Mark chosen card as selected.
            cards[card.id].toggleSelection()
            //Appened chosen card to an array
            chosenCards.append(cards[card.id])
        }
        
        if (chosenCards.count == 3) {
            // Compare Set
            print("I need to compare set now!")
            
            //clear selection for the first 3 card in chosen cards
            for i in (0..<chosenCards.count) {
                cards[chosenCards[i].id].isSelected = !cards[chosenCards[i].id].isSelected
            }
            //Empty chosen card array.
            chosenCards = []
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
        
        mutating func toggleSelection() {
            isSelected = !isSelected
        }
    }
}
