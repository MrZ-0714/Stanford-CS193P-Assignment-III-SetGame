//
//  SetGameVM.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/13/21.
//

import SwiftUI

class SetGameVM: ObservableObject {
    @Published private var model: SetGame<Oval> = SetGameVM.createSetGame()
    
    private static func createSetGame() -> SetGame<Oval> {
        let dataSetStrings = [Oval(), Oval()]
        
        return SetGame(numberOfCards: dataSetStrings.count) {
            index in dataSetStrings[index]
        }
    }
    
    var cards: Array<SetGame<Oval>.Card> {
        model.cards
    }
    
    func choose(card: SetGame<Oval>.Card) {
        objectWillChange.send()
        model.choose(card: card)
    }
}
