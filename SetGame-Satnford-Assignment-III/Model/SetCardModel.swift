//
//  SetCardModel.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/27/21.
//

import SwiftUI

struct SetGameCard {
    private var numberOfShapes: Int
    private var opacity: Double
    private var color: SwiftUI.Color
    public var returnedShape : some View {
        return Oval().colorMultiply(color).opacity(opacity)
    }
    // TODO: public var shapeType: Enum
    
    init(numberOfShapes: Int, opacity: Double, color: SwiftUI.Color) {
        self.numberOfShapes = numberOfShapes
        self.opacity = opacity
        self.color = color
    }
}
