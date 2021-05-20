//
//  NavigationBarDetailView.swift
//  WatchYourMind
//
//  Created by Gatang on 26/4/2564 BE.
//

import SwiftUI
struct NavigationBarDetailView: View {
  // MARK: - PROPERTY
//    let feedback = UIImpactFeedbackGenerator(style: .medium)
//  @EnvironmentObject var shop: Shop
    let feedback = UIImpactFeedbackGenerator(style: .heavy)
    @EnvironmentObject var homeview: HomeView
    
  // MARK: - BODY
  
  var body: some View {
    
    HStack {
      Button(action: {
        withAnimation(.easeIn) {
          feedback.impactOccurred()
          homeview.selectedPage = nil
          homeview.showingPage = false
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

// MARK: - PREVIEW

struct NavigationBarDetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationBarDetailView()
      .environmentObject(Shop())
//      .previewLayout(.sizeThatFits)
//      .padding()
//      .background(Color.gray)
  }
}
