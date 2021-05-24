//
//  NavigationBarDetailView.swift
//  WatchYourMind
//
//  Created by Gatang on 26/4/2564 BE.
//

import SwiftUI
struct NavigationBarDetailView: View {
  // MARK: - PROPERTY
    let feedback = UIImpactFeedbackGenerator(style: .medium)
  @EnvironmentObject var shop: Shop
    
  // MARK: - BODY
  
  var body: some View {
    HStack {
      Button(action: {
        withAnimation(.easeIn) {
          feedback.impactOccurred()
          shop.showingProduct = false
        }
      }, label: {
        Image(systemName: "chevron.left")
          .font(.title)
          .foregroundColor(.white)
      })
      
      Spacer()
//      .frame(width: UIScreen.Widthscreen)
      
//      Button(action: {}, label: {
//        Image(systemName: "cart")
//          .font(.title)
//          .foregroundColor(.white)
//      })
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
