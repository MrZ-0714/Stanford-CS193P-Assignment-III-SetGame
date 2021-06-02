//
//  SetCardModel.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/27/21.
//

import SwiftUI

struct SetGameCard {
    private var shapeType: String
    private var numberOfShapes: Int
    private var opacity: Double
    //private var color: SwiftUI.Color
    
    private struct returnedShape : Shape {
        var shapeType: String
        
        func path(in rect: CGRect) -> Path {
            switch shapeType {
            case "Oval":
                return Oval().path(in: rect)
            case "Circle":
                return Circle().path(in: rect)
            case "Diamond":
                return Diamond().path(in: rect)
            default:
                return Circle().path(in: rect)
            }
        }
        
    }
    
    public var cardToShow : some View {
        return
            VStack(spacing: 5) {
                ForEach(0..<numberOfShapes) { _ in 
                    returnedShape.init(shapeType: shapeType)
                        .stroke(Color.black, lineWidth: 1.0)
                        .overlay(returnedShape.init(shapeType: shapeType).foregroundColor(Color.black).opacity(opacity))
                }
            }
    }
    
    init(shapeType: String, numberOfShapes: Int, opacity: Double){//}, color: SwiftUI.Color) {
        self.shapeType = shapeType
        self.numberOfShapes = numberOfShapes
        self.opacity = opacity
        //self.color = color
    }
    
    enum ShapeTypes: String, CaseIterable, Equatable {
        case Oval, Circle, Diamond
    }
    
    enum NumberOfShapesToDraw: Int, CaseIterable, Equatable {
        case one = 1, two, three
    }
    
    enum Opacities: Double, CaseIterable, Equatable {
        case None = 0.0
        case aThird = 0.3
        case full = 1
    }
    //    
    //    enum ShapeColors: SwiftUI.Color, CaseIterable, Equatable {
    //        var rawValue: Color
    //        
    //        typealias RawValue = SwiftUI.Color
    //        case red, black, orange
    //    }
    
}
