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
                card in SetGameCardView(card: SetGameCardVM.init(shapeType: "Oval", numberOfShapes: 3, opacity: 1.0, shapeColor: "Red"))
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
