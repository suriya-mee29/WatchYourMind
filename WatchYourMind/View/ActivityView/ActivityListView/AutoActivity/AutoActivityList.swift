//
//  ActivityListView.swift
//  WatchYourMind
//
//  Created by Gatang on 9/3/2564 BE.
//

import SwiftUI

struct AutoActivityList: View {
    @State private var flipped = false
    @State private var animate3d = false
    @ObservedObject var arr : AutoActivityViewModel = AutoActivityViewModel()
    @Binding var isSelectedAuto: [ManualActivityModel]
    
    @ObservedObject var activityStore = ActivityStore()
    
//    let itemActivity: ManualActivityModel
    
    
    var body: some View {
      
        
        VStack(alignment: .leading, spacing: 0){
                
//                ScrollView(.vertical, showsIndicators: false, content: {

            HStack {
                
                Image(systemName: "circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.yellow)

                VStack(alignment:.leading, spacing: 0) {
                    Text("Auto Activity")
                        .font(.system(size: 30))
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("\(self.activityStore.activityList.count) Activities")
                }
            
            }
                VStack(alignment: .leading) {
                    ScrollView(.vertical, showsIndicators: false, content:{
                        
                        ForEach(self.activityStore.activityList) { item in
                            if item.type == "AUTO"{
                                ManualActivityFlipView(activityName: item.title , assined:"\(item.count)", create: item.createdDate,  description: item.description)
                                    .padding()
                            }
                        
                       

                                
                      
           
                    }
                        
                    })
           
                }

            }
           
            
            
        
    }
}

struct AutoActivityList_Previews: PreviewProvider {
    static var previews: some View {
        AutoActivityList(isSelectedAuto: .constant([]))
    }
}
