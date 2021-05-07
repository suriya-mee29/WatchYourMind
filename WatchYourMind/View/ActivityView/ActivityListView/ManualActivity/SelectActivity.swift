//
//  SelectActivity.swift
//  WatchYourMind
//
//  Created by Gatang on 6/5/2564 BE.
//

import SwiftUI

struct SelectActivity: View {
    @State private var circleColorChanged = false
        @State private var heartColorChanged = false
        @State private var heartSizeChanged = false
     
        var body: some View {
     
            ZStack {
                Circle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(circleColorChanged ? Color(.systemGray5) : .red)
     
                Image(systemName: "heart.fill")
                    .foregroundColor(heartColorChanged ? .red : .white)
                    .font(.system(size: 100))
                    .scaleEffect(heartSizeChanged ? 1.0 : 1.0)
            }
            .onTapGesture {
                self.circleColorChanged.toggle()
                self.heartColorChanged.toggle()
                self.heartSizeChanged.toggle()
            }
     
        }
}

struct SelectActivity_Previews: PreviewProvider {
    static var previews: some View {
        SelectActivity()
    }
}
