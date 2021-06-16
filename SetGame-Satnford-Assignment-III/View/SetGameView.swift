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
            Text("You've found \(setGameVM.score) set\(setGameVM.score > 1 ? "s" : "")")
                .bold()
                .font(.title3)
                .padding()
            Grid(setGameVM.cardsInDisplay) {
                card in SetGameCardView(cardContent: SetGameCardVM.init(
                    numberOfShapes: card.content.numberOfShapes,
                    shapeType: card.content.shapeType,
                    shapeColor: card.content.shapeColor,
                    opacity: card.content.opacity
                ))
                .background(card.isSelected ? Color.blue.opacity(0.3) : nil )
                .onTapGesture{setGameVM.choose(card: card)}
            }
            
            HStack() {
                Spacer()
                Button(action: {setGameVM.startNewGame()}) {
                    Text("New Game")
                        .bold()
                        .padding(20)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(12)
                }
                Spacer()
                Button(action: {setGameVM.deal3MoreCards()}) {
                    Text("Deal 3 cards")
                        .bold()
                        .padding(20)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                Spacer()
                
                ZStack() {
                    
                }
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
