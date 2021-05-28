//
//  SetGameVM.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/13/21.
//

import SwiftUI

class SetGameVM: ObservableObject {
    @Published private var model: SetGame<SetGameCard> = SetGameVM.createSetGame()
    
    private static func createSetGame() -> SetGame<SetGameCard> {
        let dataSetStrings = [
            SetGameCard(numberOfShapes: 1, opacity: 1, color: .red),
            SetGameCard(numberOfShapes: 2, opacity: 0.5, color: .blue)
        ]
        
        return SetGame(numberOfCards: dataSetStrings.count) {
            index in dataSetStrings[index]
        }
    }
    
    var cards: Array<SetGame<SetGameCard>.Card> {
        model.cards
    }
    
    func choose(card: SetGame<SetGameCard>.Card) {
        objectWillChange.send()
        model.choose(card: card)
    }
}
