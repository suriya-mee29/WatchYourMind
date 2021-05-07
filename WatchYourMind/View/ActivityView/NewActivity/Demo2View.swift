//
//  Demo2View.swift
//  WatchYourMind
//
//  Created by Gatang on 16/3/2564 BE.
//

import SwiftUI

struct Demo2View: View {
    var body: some View {
        ZStack {
            Text("Movies View")
                .foregroundColor(.black)
                .font(Font.system(size: 25, weight: .bold))
        }
    }
}

struct Demo2View_Previews: PreviewProvider {
    static var previews: some View {
        Demo2View()
    }
}
