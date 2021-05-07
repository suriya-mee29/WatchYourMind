//
//  ActivityListView.swift
//  WatchYourMind
//
//  Created by Gatang on 8/3/2564 BE.
//

import SwiftUI



struct AutoActivityListFront: View {
    
//    let activityList: ListActivity
    let activityName: String
    let assined:String
    let create: Date
    let colorActivity: String
    @State var isBack : Bool = false
    

    var body: some View {

        VStack(alignment: .center){
            Text(activityName)
                    .font(.system(size: 30))
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(colorActivity))
                .padding(.horizontal,10)
                .padding(.vertical)
            
        HStack(alignment: .center, spacing: 0){
            HStack {
             
                Image(systemName: "person.3")
                    
                    
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                    
                Text(assined)
                .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding(.top,10)
//                    .foregroundColor(Color("discontinueueColor"))

            }//:HSTACK
            .padding(.top,13)
            .padding(.trailing)
            
            HStack {
                VStack{
                    Text("Created:")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Text("\(create , formatter: taskDateFormat)")
                        .font(.system(size: 20))
                        .padding(.trailing,20)
                }
            }//:HSTACK
//            .padding(.leading,30)
            
            }//:HSTACK ALL
        }//:VSTACK

        .frame(width: 300, height: 150,alignment: .center)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10 )
        
        
//    }//:BUTTON
        
//        if showDetails {
//            Text(details)
//                .font(.title)
//        }
    }//body: some View
}//ActivityListView: View

struct AutoActivityListFront_Previews: PreviewProvider {


    static var previews: some View {
        AutoActivityListFront(activityName: "Fitness", assined: "32", create:Date(), colorActivity: "completeColor")
            .previewDevice("iPad Pro")
            .padding()
        
    }
}
