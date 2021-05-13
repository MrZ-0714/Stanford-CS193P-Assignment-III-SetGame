//
//  CustomShape-Round.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/12/21.
//

import SwiftUI

struct Round: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = CGFloat( min(rect.width, rect.height) / 2) - min(rect.width, rect.height) * 0.1
        
        p.addArc(center: center,
                 radius: radius,
                 startAngle: Angle.degrees(0),
                 endAngle: Angle.degrees(360),
                 clockwise: true)
        
        return p
    }
}
