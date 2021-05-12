//
//  CustomShape-Diamond.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/12/21.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let p1 = CGPoint(x: center.x - rect.maxX / 2 + rect.maxX * 0.1, y: center.y)
        let p2 = CGPoint(x: center.x,                                   y: center.y - rect.maxY / 2 + rect.maxY * 0.1)
        let p3 = CGPoint(x: center.x + rect.maxX / 2 - rect.maxX * 0.1, y: center.y)
        let p4 = CGPoint(x: center.x,                                   y: center.y + rect.maxY / 2 - rect.maxY * 0.1)
        
        p.move(to: p1)
        p.addLine(to: p2)
        p.addLine(to: p3)
        p.addLine(to: p4)
        p.addLine(to: p1)
        
//        print(p1,p2,p3,p4)
        
        return p
    }
}
