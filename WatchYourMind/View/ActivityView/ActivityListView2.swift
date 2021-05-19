//
//  ActivityListView2.swift
//  WatchYourMind
//
//  Created by Gatang on 31/3/2564 BE.
//

import SwiftUI

struct ActivityListView2: View {
    @State private var isIphone : Bool = true
    @State var showSheetView = false


    var body: some View {
        NavigationView {
        ScrollView(.vertical, showsIndicators: false) {
            if !isIphone{
                
                
                    HStack (alignment: .top){
                        AutoActivityList(isSelectedAuto: .constant([]), selectedActivities: .constant([]))
                          //  ManualActivityList()

     
                    }
                }
            else{
                VStack {
                    AutoActivityList(isSelectedAuto: .constant([]), selectedActivities: .constant([]))
                   // ManualActivityList()
                    
              
                }

            }
            
            

            


  
    }//:ScrollView
        
        
        
        
                .onAppear(perform: {
                    if UIDevice.current.userInterfaceIdiom == .phone{
                       isIphone = true
                    }else{
                        isIphone = false
                    }
                })//:onAppear

            .navigationBarTitle("ActivityListView", displayMode: .large)
//        .navigationBarItems(trailing:
////            NavigationLink(destination: NewActivityView()) {
//               VStack {
//                   Button(action: {
//                       print("SF Symbol button pressed...")
//                   }) {
//                       Image(systemName: "plus.circle")
////                           .imageScale(.large)
//                        .font(.system(size: 40))
//                   }
//
//               }//:VSTACK
//               }//:NavigationLink
//           )
            
        }//:NavigationView
        .navigationViewStyle(StackNavigationViewStyle())

            
    
    
}
    
}

struct ActivityListView2_Previews: PreviewProvider {
    static var previews: some View {
        ActivityListView2()
    }
}
