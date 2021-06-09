//
//  SetCardModel.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/27/21.
//

import SwiftUI

struct SetGameCardVM {
    public var numberOfShapes: Int
    public var shapeType: String
    public var shapeColor: String
    public var opacity: Double
    
    init(shapeType: String, numberOfShapes: Int, opacity: Double, shapeColor: String) {
        self.shapeType = shapeType
        self.numberOfShapes = numberOfShapes
        self.opacity = opacity
        self.shapeColor = shapeColor
    }
    
    static func initFullSetGameDeck() -> [Self] {
        var fullSetGameCardsDeck = [Self]()
        
        for number in SetGameCardVM.NumberOfShapesToDraw.allCases {
            for shape in SetGameCardVM.ShapeTypes.allCases {
                for opacity in SetGameCardVM.Opacities.allCases {
                    for shapeColor in SetGameCardVM.ShapeColors.allCases {
                        fullSetGameCardsDeck.append(SetGameCardVM(shapeType: shape.rawValue, numberOfShapes: number.rawValue, opacity: opacity.rawValue, shapeColor: shapeColor.rawValue))
                    }
                }
            }
        }
        
        return fullSetGameCardsDeck
    }
    
    struct cardShape : Shape {
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
    
    struct cardColor {
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
    
    enum NumberOfShapesToDraw: Int, CaseIterable, Equatable {
        case one = 1, two, three
    }
    
    enum ShapeTypes: String, CaseIterable, Equatable {
        case Oval, Circle, Diamond
    }
    
    enum ShapeColors: String, CaseIterable, Equatable {
        case Red, Blue, Black
    }
    
    enum Opacities: Double, CaseIterable, Equatable {
        case None = 0.0
        case aThird = 0.3
        case full = 1
    }
}
