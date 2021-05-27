//
//  SetCardModel.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/27/21.
//

import SwiftUI

struct SetGameCard {
    public var numberOfShapes: Int
    public var opacity: Double
    public var color: SwiftUI.Color
    public var returnedShape = Oval()
    // TODO: public var shapeType: Enum
    
    init(numberOfShapes: Int, opacity: Double, color: SwiftUI.Color) {
        self.numberOfShapes = numberOfShapes
        self.opacity = opacity
        self.color = color
    }
}
