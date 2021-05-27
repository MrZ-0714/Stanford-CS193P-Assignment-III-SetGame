//
//  CardView.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 5/13/21.
//

import SwiftUI

struct CardView: View {
    var card: SetGame<SetGameCard>.Card
    
    @ViewBuilder
    var body: some View {
        card.content.returnedShape
    }
}
