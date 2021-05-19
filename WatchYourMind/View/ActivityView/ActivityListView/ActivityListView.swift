//
//  ActivityListView.swift
//  WatchYourMind
//
//  Created by Gatang on 14/3/2564 BE.
//

import SwiftUI

struct ActivityListView: View {

    @State private var isIphone : Bool = true

    
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
        }//:NavigationView
        .navigationViewStyle(StackNavigationViewStyle())

            

    }
    }




struct ActivityListView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityListView()
    }
}
