//
//  neumorphic.swift
//  WatchYourMind
//
//  Created by Gatang on 11/3/2564 BE.
//

import SwiftUI

struct neumorphic: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal,20)
            .padding(10)
            .background(Color.white)
            .cornerRadius(5)
            .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
            .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
