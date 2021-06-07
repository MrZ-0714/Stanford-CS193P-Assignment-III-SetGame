//
//  CardView.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/13/21.
//

import SwiftUI

struct SetGameCardView: View {
    var card: SetGameCardVM
    
    @ViewBuilder
    var body: some View {
        GeometryReader {
            geometry in VStack(spacing: 5) {
                ForEach(0..<card.numberOfShapes) { _ in
                    SetGameCardVM.cardShape.init(shapeType: card.shapeType)
                        .stroke(
                            SetGameCardVM.cardColor.init(coloring: card.shapeColor).getColor(),
                            lineWidth: 1.0)
                        .overlay(SetGameCardVM.cardShape.init(shapeType: card.shapeType)
                                    .foregroundColor(
                                        SetGameCardVM.cardColor.init(coloring: card.shapeColor).getColor()
                                    )
                                    .opacity(card.opacity)
                        )
                }
            }
        }
        .aspectRatio(1/1.618, contentMode: .fit)
        .border(Color.black, width: 1)
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = SetGameCardVM.init(shapeType: "Oval", numberOfShapes: 3, opacity: 0.3, shapeColor: "Red")
        SetGameCardView(card: card)
    }
}
