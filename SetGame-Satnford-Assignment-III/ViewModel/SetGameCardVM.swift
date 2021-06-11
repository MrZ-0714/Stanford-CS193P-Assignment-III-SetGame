//
//  SetCardModel.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/27/21.
//

import SwiftUI

struct SetGameCardVM: EqutableCardContent, Equatable {
    typealias FeatureA = NumberOfShapesToDraw
    typealias FeatureB = ShapeTypes
    typealias FeatureC = ShapeColors
    typealias FeatureD = Opacities
    
    var featureA: NumberOfShapesToDraw { numberOfShapes }
    var featureB: ShapeTypes { shapeType }
    var featureC: ShapeColors { shapeColor }
    var featureD: Opacities { opacity }
    
    public var numberOfShapes: NumberOfShapesToDraw
    public var shapeType: ShapeTypes
    public var shapeColor: ShapeColors
    public var opacity: Opacities
    
    init(numberOfShapes: NumberOfShapesToDraw, shapeType: ShapeTypes, shapeColor: ShapeColors, opacity: Opacities) {
        self.shapeType = shapeType
        self.numberOfShapes = numberOfShapes
        self.opacity = opacity
        self.shapeColor = shapeColor
    }
    
    static func initFullSetGameDeck() -> [Self] {
        var fullSetGameCardsDeck = [Self]()
        
        for numberOfShapes in SetGameCardVM.NumberOfShapesToDraw.allCases {
            for shapeType in SetGameCardVM.ShapeTypes.allCases {
                for shapeColor in SetGameCardVM.ShapeColors.allCases {
                    for opacity in SetGameCardVM.Opacities.allCases {
                        fullSetGameCardsDeck.append(SetGameCardVM(numberOfShapes: numberOfShapes, shapeType: shapeType, shapeColor: shapeColor, opacity: opacity))
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
    
    enum NumberOfShapesToDraw: Int, CaseIterable, Equatable, ContentFeature {
        typealias feature = Self
        case one = 1, two, three
    }
    
    enum ShapeTypes: String, CaseIterable, Equatable, ContentFeature {
        typealias feature = Self
        case Oval, Circle, Diamond
    }
    
    enum ShapeColors: String, CaseIterable, Equatable, ContentFeature {
        typealias feature = Self
        case Red, Blue, Black
    }
    
    enum Opacities: Double, CaseIterable, Equatable, ContentFeature {
        typealias feature = Self
        case None = 0.0
        case aThird = 0.3
        case full = 1
    }
}
