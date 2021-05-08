//
//  NavigationPreActivity.swift
//  WatchYourMind
//
//  Created by Gatang on 8/5/2564 BE.
//

import SwiftUI

struct NavigationPreActivity: View {
    let feedback = UIImpactFeedbackGenerator(style: .heavy)
    @EnvironmentObject var preactivity: Preact
    
    var body: some View {
        HStack {
          Button(action: {
            withAnimation(.easeIn) {
              feedback.impactOccurred()
                preactivity.selectedProduct = nil
                preactivity.showingProduct = false
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
struct NavigationPreActivity_Previews: PreviewProvider {
    static var previews: some View {
        NavigationPreActivity()
    }
}
