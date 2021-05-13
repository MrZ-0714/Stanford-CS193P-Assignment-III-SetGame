//
//  CustomShape-Diamond.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/12/21.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in

            let center = CGPoint(x: rect.midX, y: rect.midY)
            let width = rect.width
            let height = rect.height
            
            let p1 = CGPoint(x: center.x - width / 2 + width * 0.1, y: center.y)
            let p2 = CGPoint(x: center.x,                           y: center.y - height / 2 + height * 0.1)
            let p3 = CGPoint(x: center.x + width / 2 - width * 0.1, y: center.y)
            let p4 = CGPoint(x: center.x,                           y: center.y + height / 2 - height * 0.1)
            
            path.addLines([p1,p2,p3,p4])
            
            path.closeSubpath()
        }
    }
}
