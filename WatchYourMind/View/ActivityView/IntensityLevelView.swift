//
//  IntensityLevelView.swift
//  WatchYourMind
//
//  Created by Gatang on 2/3/2564 BE.
//

import SwiftUI

struct IntensityLevelView: View {
    @Binding  var sliderValue: Double
    @State var minValue: Float = 0.0
    @State var maxValue: Float = Float(UIScreen.main.bounds.width - 50.0)

    var body: some View {
        

        
        VStack {
            HStack(spacing: 25) {
                Text("0%")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                Slider(value: $sliderValue, in: 0...100)
                    .accentColor(.purple)
                    

                Text("100%")
                    .font(.system(size: 25))
                    .fontWeight(.bold)

            }.foregroundColor(Color.purple)
            .padding(.horizontal)
            HStack {
                Text("Intensity Level is:")
                    .font(.system(size: 30))
                Text( "\(Int(sliderValue))%" )
                    .font(.system(size: 30))
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.purple)
                
                    
            }
        }
        
        
    }
}

struct IntensityLevelView_Previews: PreviewProvider {
    static var previews: some View {
        IntensityLevelView(sliderValue: .constant(50))
    }
}
