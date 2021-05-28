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
        var dataSetStrings = [SetGameCard]()
        for _ in 0...15 {
            dataSetStrings.append(SetGameCard(numberOfShapes: 1, opacity: 0.5, color: .red))
        }
        
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
