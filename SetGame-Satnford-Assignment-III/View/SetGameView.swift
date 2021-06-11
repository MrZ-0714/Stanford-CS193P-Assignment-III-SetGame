//
//  ContentView.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/12/21.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var setGameVM: SetGameVM
    
    var body: some View {
        VStack() {
            Grid(setGameVM.cards) {
                card in SetGameCardView(cardContent: SetGameCardVM.init(
                    numberOfShapes: card.content.numberOfShapes,
                    shapeType: card.content.shapeType,
                    shapeColor: card.content.shapeColor,
                    opacity: card.content.opacity
                )
                )
                .background(card.isSelected ? Color.blue.opacity(0.3) : nil )
                .onTapGesture {setGameVM.choose(card: card)}
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let setGame = SetGameVM()
        SetGameView(setGameVM: setGame)
    }
}
