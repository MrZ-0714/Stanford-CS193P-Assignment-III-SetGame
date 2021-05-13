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
        VStack {
            ForEach(setGameVM.cards){ card in
                CardView(card: card).onTapGesture {
                    setGameVM.choose(card: card)
                }
            }
            
        }
    }
}

struct CardView: View {
    var card: SetGame<String>.Card
    
    @ViewBuilder
    var body: some View {
            Text(card.content).padding(15)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let setGame = SetGameVM()
        SetGameView(setGameVM: setGame)
    }
}
