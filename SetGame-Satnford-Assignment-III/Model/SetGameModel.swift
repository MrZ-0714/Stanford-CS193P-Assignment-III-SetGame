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
    private(set) var notInDisplayCards: Array<Card> = []
    private(set) var chosenCards: Array<Card> = []
    private(set) var dicoveredSets: Array<threeChosenCards<Card>> = []
    private(set) var numberOfSetsDiscovered: Int = 0
    
    mutating func choose(card: Card) {
        // Print the chosen card.
        print("Chosen card: \(card.id)")
        // Determine if the seleced card is already selected or not
        if (allCards[card.id].isSelected) {
            // If so, toggle selection and remove the card from chosenCards
            allCards[card.id].toggleSelected()
            chosenCards.remove(at: chosenCards.firstIndex(matching: card)!)
            inDisplayCardsToggle(matching: card, type: Card.actionType.isSelected.rawValue)
        } else {
            // Mark chosen card as selected.
            allCards[card.id].toggleSelected()
            inDisplayCardsToggle(matching: card, type: Card.actionType.isSelected.rawValue)
            //Appened chosen card to an array
            chosenCards.append(allCards[card.id])
        }
        
        if (chosenCards.count == 3) {
            // Compare Set
            print("I need to check if they make a set now!")
            if threeChosenCards<Card>.init(chosenCards).checkIfCardsMakeASet() {
                print("Found a set")
                //TODO:
                //put all 3 cards to discoveredSets
                dicoveredSets.append(threeChosenCards<Card>.init(chosenCards))
                //numberOfSetsDiscovered += 1
                numberOfSetsDiscovered += 1
                //remove all 3 cards from inDisplayCards
                for chosenCard in chosenCards {
                    inDisplayCards.remove(at: inDisplayCards.firstIndex(matching: chosenCard)!)
                }
                //get 3 new cards from notInDisplayCards and append them to inDisplayCards and remove them from notInDisplayCards
                if notInDisplayCards.count != 0 {
                    var maxCardToPullIn: Int = 3
                    if notInDisplayCards.count <= 3 {
                        maxCardToPullIn = notInDisplayCards.count
                    }
                    for _ in 0..<maxCardToPullIn {
                        inDisplayCards.append(notInDisplayCards[0])
                        notInDisplayCards.remove(at: 0)
                    }
                }
                //Empty chosenCards array
                chosenCards = []
                
            } else {
                print("Not a set")
                //clear selection for the first 3 card in chosen cards
                for i in 0..<chosenCards.count {
                    allCards[chosenCards[i].id].isSelected.toggle()
                    inDisplayCardsToggle(matching: chosenCards[i], type: Card.actionType.isSelected.rawValue)
                }
                //Empty chosenCards array
                chosenCards = []
            }
        }
    }
    
    init(numberOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        allCards = Array<Card>()
        for id in 0..<numberOfCards {
            let content: CardContent = cardContentFactory(id)
            allCards.append(Card(id: id, content: content))
        }
        let (inDisplayCardIds, notInDisplayCardIds) = Int.randomlyChooseWithNoRepeat(numberOfElement: 12, in: 0..<numberOfCards)
        //Manually assign cards for testing.
//        inDisplayCardIds = []
//        notInDisplayCardIds = []
//        for i in 0..<12 {
//            inDisplayCardIds.append(i)
//        }
//        for i in 12..<15 {
//            notInDisplayCardIds.append(i)
//        }
//        print(inDisplayCardIds.count)
//        print(notInDisplayCardIds.count)
        
        for i in inDisplayCardIds {
            inDisplayCards.append(allCards[i])
            allCards[i].isFaceUp.toggle()
        }
        
        for i in notInDisplayCardIds {
            notInDisplayCards.append(allCards[i])
        }
        
    }
    
    struct Card: Identifiable {
        var id: Int
        var isSelected: Bool = false
        var isInASet: Bool = false
        var isFaceUp: Bool = false
        var content: CardContent
        
        mutating func toggleSelected() {
            isSelected = !isSelected
        }
        
        mutating func toggleFaceUp() {
            isFaceUp = !isFaceUp
        }
        
        enum actionType: String, CaseIterable {
            case isSelected, isInASet, isFaceUp
        }
        
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
    
    //MARK: - helpers 
    mutating func inDisplayCardsToggle(matching: Card, type: String) {
        if type == "isSelected" {
            inDisplayCards[inDisplayCards.firstIndex(matching: matching)!].toggleSelected()
        }
    }
}
