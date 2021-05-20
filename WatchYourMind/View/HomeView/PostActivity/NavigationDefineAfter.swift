//
//  NavigationDefineAfter.swift
//  WatchYourMind
//
//  Created by Gatang on 20/5/2564 BE.
//

import SwiftUI

struct NavigationDefineAfter: View {
    let feedback = UIImpactFeedbackGenerator(style: .heavy)
    @EnvironmentObject var somethingAnaly: somethingAnalysis
    var body: some View {
        HStack {
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

struct NavigationDefineAfter_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDefineAfter()
    }
}
