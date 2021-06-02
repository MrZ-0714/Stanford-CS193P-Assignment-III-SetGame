//
//  CardView.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/13/21.
//

import SwiftUI

struct CardView: View {
    var card: SetGame<SetGameCard>.Card
    
    @ViewBuilder
    var body: some View {
        GeometryReader {
            geometry in card.content.cardToShow
        }
        .aspectRatio(1/1.618, contentMode: .fit)
        .border(Color.black, width: 1)
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = SetGameVM.init().cards[0]
        CardView(card: card)
    }
}
