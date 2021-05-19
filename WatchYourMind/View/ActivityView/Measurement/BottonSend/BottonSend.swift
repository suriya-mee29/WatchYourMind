//
//  BottonSend.swift
//  WatchYourMind
//
//  Created by Gatang on 18/3/2564 BE.
//

import SwiftUI

struct BottonSend: View {
  
        @Binding var checklistindicator :[CheckIndicator]
        @State var showBanner:Bool = false
        @State var bannerData: BannerModifier.BannerData = BannerModifier.BannerData(title: "Notification Title", detail: "Notification text for the action you were trying to perform.", type: .Warning)
        var body: some View {
            VStack(alignment: .center, spacing: 4) {
                Button(action: {
                    self.bannerData.type = .Success
                    self.showBanner = true
                }) {
                    HStack {
                        Text("SEND")
                        Image(systemName: "paperplane")
                    }
                }
            }
            .banner(data: $bannerData, show: $showBanner)
            .buttonStyle(neumorphic(color: Color.background))
         .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)

            

            
        }    
}

struct BottonSend_Previews: PreviewProvider {
    static var previews: some View {
        BottonSend(checklistindicator: .constant([]))
    }
}
