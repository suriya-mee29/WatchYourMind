//
//  MeasureFront.swift
//  WatchYourMind
//
//  Created by Gatang on 17/3/2564 BE.
//

import SwiftUI

struct MeasureFront: View {
    let activityName: String
    let Description:String
    let colorActivity: String
    @State var isBack : Bool = false
    var body: some View {
        
        VStack(alignment: .center){
//            VStack(alignment: .center){
                Text(activityName)
                        .font(.system(size: 30))
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(colorActivity))
                        .padding(.horizontal,10)
                    .padding(.top,20)
                    .padding(.bottom,10)

            Text("When feeling depressed, stressed, or not relaxed From the current situation")
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
        MeasureFront(activityName: "Music Relaxation", Description: "35",  colorActivity: "incompleteColor")
    }
}
