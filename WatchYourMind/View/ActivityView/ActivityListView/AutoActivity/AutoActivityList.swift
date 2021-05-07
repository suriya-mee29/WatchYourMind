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
                    
//                    Text("\(arr.arrManualAcc
                }
            
            }
                VStack(alignment: .leading) {
                  
//                    ForEach(arr.arrManualActivity ?? []) { item in
//
//                        ManualActivityFlipView(activityName: item.title , assined:"\(arr.PersonCount())", create: item.createDate,  description: item.description)
//
//
//                        .padding()
//
//                    }
                
//                ForEach(1 ..< 2) { item in
////                for value in 1...2 {
//
//                    AutoActivityFlipView(activityName: "Fitness", assined: "32" , create: Date(), titlename: "Fitness", description: "Mindfulness is the basic human ability to be fully present,aware of where we are and what we’re doing, and not overly reactive or overwhelmed by what’s going on around us.")
//
//
//                    AutoActivityFlipView(activityName: "Mindfulness", assined: "32" , create: Date(), titlename: "Fitness", description: "Mindfulness is the basic human ability to be fully present,aware of where we are and what we’re doing, and not overly reactive or overwhelmed by what’s going on around us.")
//                }
//                .padding()

                
           
                }
//        })
            }
           
            
            
        
    }
}

struct AutoActivityList_Previews: PreviewProvider {
    static var previews: some View {
        AutoActivityList(isSelectedAuto: .constant([]))
    }
}
