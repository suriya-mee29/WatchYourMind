//
//  NavigationbarSonethingAnalysis.swift
//  WatchYourMind
//
//  Created by Gatang on 13/5/2564 BE.
//

import SwiftUI

struct NavigationbarSonethingAnalysis: View {
    let feedback = UIImpactFeedbackGenerator(style: .heavy)
    @EnvironmentObject var somethingAnaly: somethingAnalysis
    
    var body: some View {
        HStack{
          Button(action: {
            withAnimation(.easeIn) {
              feedback.impactOccurred()
                somethingAnaly.selectedPage = nil
                somethingAnaly.showingPage = false
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

struct NavigationbarSonethingAnalysis_Previews: PreviewProvider {
    static var previews: some View {
        NavigationbarSonethingAnalysis()
    }
}
