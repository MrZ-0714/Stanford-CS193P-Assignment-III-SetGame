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
        var cardContents = [SetGameCardVM]()
        
        for number in SetGameCardVM.NumberOfShapesToDraw.allCases {
            for shape in SetGameCardVM.ShapeTypes.allCases {
                for opacity in SetGameCardVM.Opacities.allCases {
                    for shapeColor in SetGameCardVM.ShapeColors.allCases {
                        cardContents.append(SetGameCardVM(shapeType: shape.rawValue, numberOfShapes: number.rawValue, opacity: opacity.rawValue, shapeColor: shapeColor.rawValue))
                    }
                }
            }
        }
        
        return SetGameModel(numberOfCards: cardContents.count) {
            index in cardContents[index]
        }
    }
    
    var cards: Array<SetGameModel<SetGameCardVM>.Card> {
        model.cards
    }
    
    func choose(card: SetGameModel<SetGameCardVM>.Card) {
        objectWillChange.send()
        model.choose(card: card)
    }
}
