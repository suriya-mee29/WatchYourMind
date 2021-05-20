//
//  NavigationBarManualActivityList.swift
//  WatchYourMind
//
//  Created by Gatang on 2/5/2564 BE.
//

import SwiftUI

struct NavigationBarManualActivityList: View {
    let prefeedback = UIImpactFeedbackGenerator(style: .medium)

    @EnvironmentObject var activitylist: ManualList
    
    var body: some View {
        HStack{
          Button(action: {
            withAnimation(.easeIn) {
              prefeedback.impactOccurred()
                activitylist.selectedPage = nil
                activitylist.showingPage = false
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

struct NavigationBarManualActivityList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarManualActivityList()
    }
}
//struct NavigationBarManualActivityList_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationBarManualActivityList()
//    }
//}
