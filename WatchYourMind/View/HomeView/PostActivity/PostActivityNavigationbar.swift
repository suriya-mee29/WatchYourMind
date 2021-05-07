//
//  PostActivityNavigationbar.swift
//  WatchYourMind
//
//  Created by Gatang on 5/5/2564 BE.
//

import SwiftUI

struct PostActivityNavigationbar: View {
    let feedback = UIImpactFeedbackGenerator(style: .medium)
    @EnvironmentObject var discontinue: PostActivity
    
    var body: some View {
       HStack {
          Button(action: {
            withAnimation(.easeIn) {
              feedback.impactOccurred()
                discontinue.selectedProduct = nil
                discontinue.showingProduct = false
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

struct PostActivityNavigationbar_Previews: PreviewProvider {
    static var previews: some View {
        PostActivityNavigationbar()
    }
}
