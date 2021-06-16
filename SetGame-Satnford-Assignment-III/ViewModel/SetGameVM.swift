//
//  SetGameVM.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/13/21.
//

import SwiftUI

class SetGameVM: ObservableObject {
    @Published private var model: SetGameModel<SetGameCardVM> = SetGameVM.createSetGame()
    
    private static func createSetGame() -> SetGameModel<SetGameCardVM> {
        let fullSetGameCards = SetGameCardVM.initFullSetGameDeck()
        
        return SetGameModel(numberOfCards: fullSetGameCards.count) {
            index in fullSetGameCards[index]
        }
    }
    
    var allCards: Array<SetGameModel<SetGameCardVM>.Card> {
        model.allCards
    }
    
    var cardsInDisplay: Array<SetGameModel<SetGameCardVM>.Card> {
        model.inDisplayCards
    }
    
    var score: Int {
        model.numberOfSetsDiscovered
    }
    
    func choose(card: SetGameModel<SetGameCardVM>.Card) {
        objectWillChange.send()
        model.choose(card: card)
    }
    
    func startNewGame() -> Void {
        model = SetGameVM.createSetGame()
    }
}
