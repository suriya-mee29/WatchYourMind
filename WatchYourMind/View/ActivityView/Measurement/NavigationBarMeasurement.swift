//
//  NavigationBarMeasurement.swift
//  WatchYourMind
//
//  Created by Gatang on 2/5/2564 BE.
//

import SwiftUI

struct NavigationBarMeasurement: View {
    let feedback = UIImpactFeedbackGenerator(style: .medium)
    @EnvironmentObject var measurement: Measurement
    
    let feedbackhome = UIImpactFeedbackGenerator(style: .medium)
//    @EnvironmentObject var home: homeContentview
    
    var body: some View {
        HStack {
          Button(action: {
            withAnimation(.easeIn) {
              feedback.impactOccurred()
                measurement.selectedProduct = nil
                measurement.showingProduct = false
            }
          }, label: {
            Image(systemName: "chevron.left")
              .font(.title)
              .foregroundColor(.white)
          })
          
          Spacer()


            
        } //: HSTACK
        .padding()
        .padding(.vertical,10)
        .background(Color.purple)
        
    }
}

struct NavigationBarMeasurement_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarMeasurement()
    }
}
