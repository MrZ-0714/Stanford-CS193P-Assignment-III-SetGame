//
//  CardView.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/13/21.
//

import SwiftUI

struct SetGameCardView: View {
    var cardContent: SetGameCardVM
    
    @ViewBuilder
    var body: some View {
        GeometryReader {
            geometry in VStack(spacing: 5) {
                ForEach(0..<cardContent.numberOfShapes) { _ in
                    SetGameCardVM.cardShape.init(shapeType: cardContent.shapeType)
                        .stroke(SetGameCardVM.cardColor.init(coloring: cardContent.shapeColor).getColor(),lineWidth: 1.0)
                        .overlay(
                            SetGameCardVM.cardShape.init(shapeType: cardContent.shapeType)
                                .foregroundColor(SetGameCardVM.cardColor.init(coloring: cardContent.shapeColor).getColor())
                                .opacity(cardContent.opacity)
                        )
                }
            }
        }
        .aspectRatio(SetGameCardView.aspectRatio, contentMode: .fit)
        .border(Color.black, width: SetGameCardView.borderWidth)
        .padding()
    }
    
    static private let aspectRatio : CGFloat = (1/1.618)
    static private let borderWidth : CGFloat = 1
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let setGameCard = SetGameCardVM.init(shapeType: "Oval", numberOfShapes: 3, opacity: 0.3, shapeColor: "Red")
        SetGameCardView(cardContent: setGameCard)
    }
}
