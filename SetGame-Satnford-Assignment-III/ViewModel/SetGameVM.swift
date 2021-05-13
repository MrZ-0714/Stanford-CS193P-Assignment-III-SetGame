//
//  SetGameVM.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/13/21.
//

import SwiftUI

class SetGameVM: ObservableObject {
    @Published private var model: SetGame<String> = SetGameVM.createSetGame()
    
    private static func createSetGame() -> SetGame<String> {
        let dataSetStrings = ["a","b","c","d"]
        
        return SetGame() {
            index in dataSetStrings[index]
        }
    }
    
    var cards: Array<SetGame<String>.Card> {
        model.cards
    }
    
    func choose(card: SetGame<String>.Card) {
        objectWillChange.send()
        model.choose(card: card)
    }
}
