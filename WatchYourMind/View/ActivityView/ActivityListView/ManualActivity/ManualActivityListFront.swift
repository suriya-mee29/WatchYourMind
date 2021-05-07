//
//  ManualActivityListFront.swift
//  WatchYourMind
//
//  Created by Gatang on 14/3/2564 BE.
//

import SwiftUI

struct ManualActivityListFront: View {
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

//            Spacer()
            HStack{
                
                VStack {
                    Text("Created:")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                
                Text("\(create , formatter: taskDateFormat)")
                    .font(.system(size: 20))
                }
            }//:HSTACK

            
            }//:HSTACK ALL
       
        }//:VSTACK
        .frame(width: 300, height: 150,alignment: .center)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10 )

    }//body: some View
}//ActivityListView: View
    

struct ManualActivityListFront_Previews: PreviewProvider {
    static var previews: some View {
        ManualActivityListFront(activityName: "Music Relaxation", assined: "35", create: Date(), colorActivity: "incompleteColor")
    }
}
