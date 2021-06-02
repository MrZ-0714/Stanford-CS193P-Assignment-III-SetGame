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
    private var shapeColor: String
    
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
    
    private struct returnedColor {
        var coloring: String
        
        func getColor() -> SwiftUI.Color {
            switch coloring {
            case "Blue":
                return .blue
            case "Red":
                return .red
            case "Black":
                return .black
            default:
                return .white
            }
        }
    }
    
    public var cardToShow : some View {
        return
            VStack(spacing: 5) {
                ForEach(0..<numberOfShapes) { _ in 
                    returnedShape.init(shapeType: shapeType)
                        .stroke(
                            returnedColor.init(coloring: shapeColor).getColor(),
                            lineWidth: 1.0)
                        .overlay(returnedShape
                                    .init(shapeType: shapeType)
                                    .foregroundColor(
                                        returnedColor.init(coloring: shapeColor).getColor())
                                    .opacity(opacity)
                        )
                }
            }
    }
    
    init(shapeType: String, numberOfShapes: Int, opacity: Double, shapeColor: String) {
        self.shapeType = shapeType
        self.numberOfShapes = numberOfShapes
        self.opacity = opacity
        self.shapeColor = shapeColor
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
    
    enum ShapeColors: String, CaseIterable, Equatable {
        case Red, Blue, Black
    }
    
}
