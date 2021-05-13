//
//  CustomShape-Oval.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/12/21.
//

import SwiftUI

struct Oval: Shape {
    func path(in rect: CGRect) -> Path {
        Path { p in
            let width = rect.width
            let height = rect.height
            let radius = min(width, height) / 5
            let leftCenter = CGPoint(x: rect.midX - width / 4, y: rect.midY)
            let rightCenter = CGPoint(x: rect.midX + width / 4, y: rect.midY)
            
            p.addArc(
                center: leftCenter,
                radius: radius,
                startAngle: Angle.degrees(-90),
                endAngle: Angle.degrees(90),
                clockwise: true
            )
            p.addArc(
                center: rightCenter,
                radius: radius,
                startAngle: Angle.degrees(90),
                endAngle: Angle.degrees(-90),
                clockwise: true
            )
            
            p.closeSubpath()
        }
        
        
    }
}

