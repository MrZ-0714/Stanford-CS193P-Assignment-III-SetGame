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
                ForEach(0..<cardContent.numberOfShapes.rawValue) { _ in
                    SetGameCardVM.cardShape.init(shapeType: cardContent.shapeType.rawValue)
                        .stroke(SetGameCardVM.cardColor.init(coloring: cardContent.shapeColor.rawValue).getColor(),lineWidth: 1.0)
                        .overlay(
                            SetGameCardVM.cardShape.init(shapeType: cardContent.shapeType.rawValue)
                                .foregroundColor(SetGameCardVM.cardColor.init(coloring: cardContent.shapeColor.rawValue).getColor())
                                .opacity(cardContent.opacity.rawValue)
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
        let setGameCard = SetGameCardVM.init(
            numberOfShapes: SetGameCardVM.NumberOfShapesToDraw.three,
            shapeType: SetGameCardVM.ShapeTypes.Diamond,
            shapeColor: SetGameCardVM.ShapeColors.Blue,
            opacity: SetGameCardVM.Opacities.aThird)
        SetGameCardView(cardContent: setGameCard)
    }
}
