//
//  MeasureFront.swift
//  WatchYourMind
//
//  Created by Gatang on 17/3/2564 BE.
//

import SwiftUI

struct MeasureFront: View {
    let activity : ActivityModel
    let colorActivity: String
    @State var isBack : Bool = false
    var body: some View {
        
        VStack(alignment: .center){
//            VStack(alignment: .center){
            Text(activity.title)
                        .font(.system(size: 30))
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(colorActivity))
                        .padding(.horizontal,10)
                    .padding(.top,20)
                    .padding(.bottom,10)

            Text(activity.description)
                .padding(.horizontal,10)
                
//            }
//            Spacer()
         
      
       
        }//:VSTACK
        .frame(width: 200, height: 300,alignment: .center)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(radius: 10 )

    }//body: some View
}

struct MeasureFront_Previews: PreviewProvider {
    static var previews: some View {
        MeasureFront(activity: ActivityModel(createdby: "koi", description: "hello hello", imageIcon: "gamer", title: "Music Relexationlll", type: "MANUAL", createdDate: Date(), dockey: "key") , colorActivity: "incompleteColor")
    }
}
