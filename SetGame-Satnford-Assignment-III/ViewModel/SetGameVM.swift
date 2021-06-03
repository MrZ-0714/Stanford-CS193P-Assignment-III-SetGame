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
        var cardContents = [SetGameCard]()
        
        for number in SetGameCard.NumberOfShapesToDraw.allCases {
            for shape in SetGameCard.ShapeTypes.allCases {
                for opacity in SetGameCard.Opacities.allCases {
                    for shapeColor in SetGameCard.ShapeColors.allCases {
                        cardContents.append(SetGameCard(shapeType: shape.rawValue, numberOfShapes: number.rawValue, opacity: opacity.rawValue, shapeColor: shapeColor.rawValue))
                    }
                }
            }
        }
        
        return SetGame(numberOfCards: cardContents.count) {
            index in cardContents[index]
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
