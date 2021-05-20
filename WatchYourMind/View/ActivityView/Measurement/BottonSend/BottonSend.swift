//
//  BottonSend.swift
//  WatchYourMind
//
//  Created by Gatang on 18/3/2564 BE.
//

import SwiftUI

//class HomecontentView: ObservableObject {
//  @Published var showingProduct: Bool = false
//  @Published var selectedProduct: HomeContentView? //= nil
//}

struct BottonSend: View {
  
        
        @State var showBanner:Bool = false
        @State var bannerData: BannerModifier.BannerData = BannerModifier.BannerData(title: "Notification Title", detail: "Notification text for the action you were trying to perform.", type: .Warning)
    
        var body: some View {
            ZStack{
//                if measurement.showingProduct == false
//                {
                Button(action: {
                    self.bannerData.type = .Success
                    self.showBanner = true
                }) {
                    HStack {
                        Text("SEND")
                        Image(systemName: "paperplane")
//                            .onTapGesture {
//                              feedback.impactOccurred()
//
//                                homecontent.showingProduct = true
////                                  }
//                            }
                    }
                }
            .banner(data: $bannerData, show: $showBanner)
                .fixedSize(horizontal: false, vertical: true)
            .buttonStyle(neumorphic(color: Color.background))
         .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)

            
//                }//:IF
//                else{
//                    HomeContentView( isAuthen: .constant(true))
//                    MeasurementView(user: userRequestData[1])
//                }
            }//:ZSTACK
            
        }    
}

struct BottonSend_Previews: PreviewProvider {
    static var previews: some View {
        BottonSend()
//            .environmentObject(HomecontentView())
    }
}
