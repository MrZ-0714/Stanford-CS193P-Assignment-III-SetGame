//
//  CustomShape-Oval.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/12/21.
//

import SwiftUI

struct Circle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { p in
            let center = CGPoint(x: rect.width/2, y: rect.height/2)
            let width = rect.width
            let height = rect.height
            let radius = min(width, height) / 5
            
            p.addArc(
                center: center,
                radius: radius,
                startAngle: Angle.degrees(0),
                endAngle: Angle.degrees(360),
                clockwise: true
            )
            
            p.closeSubpath()
        }
    }
}

struct CirclePreview: PreviewProvider {
    static var previews: some View {
        VStack {
            Circle()
        }
        
    }
}

