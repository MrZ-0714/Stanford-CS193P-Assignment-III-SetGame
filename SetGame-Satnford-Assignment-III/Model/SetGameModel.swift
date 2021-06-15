//
//  Cards.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/13/21.
//

import Foundation

struct SetGameModel<CardContent> where CardContent: EqutableCardContent {
    private(set) var allCards: Array<Card>
    private(set) var inDisplayCards: Array<Card> = []
    private(set) var chosenCards: Array<Card> = []
    private(set) var dicoveredSets: Array<(Card,Card,Card)> = []
    private(set) var numberOfSetsDiscovered: Int = 0
    
    mutating func choose(card: Card) {
        // Print the chosen card.
        print("Chosen card: \(card)")
        // Determine if the seleced card is already selected or not
        if (allCards[card.id].isSelected) {
            // If so, toggle selection and remove the card from chosenCards
            allCards[card.id].isSelected.toggle()
            chosenCards.remove(at: chosenCards.firstIndex(matching: card)!)
        } else {
            // Mark chosen card as selected.
            allCards[card.id].isSelected.toggle()
            //Appened chosen card to an array
            chosenCards.append(allCards[card.id])
        }
        
        if (chosenCards.count == 3) {
            // Compare Set
            print("I need to check if they make a set now!")
            print(threeChosenCards<Card>.init(chosenCards).checkIfCardsMakeASet())
            
            //clear selection for the first 3 card in chosen cards
            for i in (0..<chosenCards.count) {
                allCards[chosenCards[i].id].isSelected.toggle()
            }
            //Empty chosen card array.
            chosenCards = []
        }
    }
    
    init(numberOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        allCards = Array<Card>()
        for id in 0..<numberOfCards {
            let content: CardContent = cardContentFactory(id)
            allCards.append(Card(id: id, content: content))
        }
        let (inDisplayCardIds, notInDisplayCardIds) = Int.randomlyChooseWithNoRepeat(numberOfElement: 12, in: 0..<numberOfCards)
        
        for i in inDisplayCardIds {
            inDisplayCards.append(allCards[i])
            allCards[i].isFaceUp.toggle()
        }
        
    }
    
    struct Card: Identifiable {
        var id: Int
        var isSelected: Bool = false
        var isInASet: Bool = false
        var isFaceUp: Bool = false
        var content: CardContent
    }
    
    struct threeChosenCards<cards> {
        private var chosenCardA: Card
        private var chosenCardB: Card
        private var chosenCardC: Card
        
        init(_ threeChosenCards: Array<Card>) {
            chosenCardA = threeChosenCards[0]
            chosenCardB = threeChosenCards[1]
            chosenCardC = threeChosenCards[2]
        }
        
        func checkIfCardsMakeASet() -> Bool {
            return
                CardContent.FeatureA.featueIsASet(chosenCardA.content.featureA, chosenCardB.content.featureA, chosenCardC.content.featureA)
                && CardContent.FeatureB.featueIsASet(chosenCardA.content.featureB, chosenCardB.content.featureB, chosenCardC.content.featureB)
                && CardContent.FeatureC.featueIsASet(chosenCardA.content.featureC, chosenCardB.content.featureC, chosenCardC.content.featureC)
                && CardContent.FeatureD.featueIsASet(chosenCardA.content.featureD, chosenCardB.content.featureD, chosenCardC.content.featureD)
        }
    }
}
