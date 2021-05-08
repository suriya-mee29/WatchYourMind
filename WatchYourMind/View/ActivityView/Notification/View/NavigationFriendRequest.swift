//
//  NavigationFriendRequest.swift
//  WatchYourMind
//
//  Created by Gatang on 7/5/2564 BE.
//

import SwiftUI

struct NavigationFriendRequest: View {
    let feedbackbell = UIImpactFeedbackGenerator(style: .heavy)
    @EnvironmentObject var clientRequest: ListClientRequest
    
    var body: some View {
        HStack {
          Button(action: {
            withAnimation(.easeIn) {
                feedbackbell.impactOccurred()
                clientRequest.selectedProduct = nil
                clientRequest.showingProduct = false
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

struct NavigationFriendRequest_Previews: PreviewProvider {
    static var previews: some View {
        NavigationFriendRequest()
            .environmentObject(ListClientRequest())
    }
}
