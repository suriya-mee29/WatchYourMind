//
//  CardOutcome.swift
//  WatchYourMind
//
//  Created by Gatang on 22/3/2564 BE.
//

import SwiftUI

struct buildCardOutcome: View{
    
    let averageHeartRate:Int
    let feeling: String
    let noting: String
    let outcomeActivity: String
    var body: some View{
        VStack(alignment:.center){
            HStack {
            
                Image(systemName: "heart.circle")
                    .foregroundColor(Color("tx-heartrate"))

                Text("AVERAGE HEART RATE : ".uppercased())
//                        .fontWeight(.bold)
                    .foregroundColor(Color("tx-heartrate"))

                Text("\(averageHeartRate)")
                    .fontWeight(.bold)
                    .foregroundColor(Color("tx-heartrate"))
                Text("bpm")
//                        .fontWeight(.bold)
                    .foregroundColor(Color("tx-heartrate"))

            }//:HSTACK
            .padding(.vertical)
                
                
            HStack {
                Image(systemName: "face.smiling.fill")
                    .foregroundColor(Color("tx-feeling"))
                
                Text("Feeling:".uppercased())
//                        .fontWeight(.bold)
                    .foregroundColor(Color("tx-feeling"))
                
                Text(feeling)
                    .fontWeight(.bold)
                    .foregroundColor(Color("tx-feeling"))
                
               
                
            }//:HSTACKText
            VStack {
                TextEdit()
                    .shadow(radius: 5 )
                    .padding(.vertical,20)
                    .padding(.horizontal,10)
            }
            .frame(width:380, height:220)
            
//                Image(systemName: "tray.and.arrow.down")
            HStack {
                Image(systemName: "tray.and.arrow.down.fill")
                    .font(.system(size: 20))
                    .foregroundColor(Color("tx-iconupload"))
                Text("Work :".uppercased())
                    .foregroundColor(Color("tx-iconupload"))
                    .padding(.top,2)
                
                Text(outcomeActivity)
                    .foregroundColor(Color("tx-iconupload"))
                    .padding(.top,2)

            }//:HSTACK
            
            }
        
    }
}


struct CardOutcome: View {
    var body: some View {
        buildCardOutcome(averageHeartRate: 93, feeling: "feeling", noting: "Distressing", outcomeActivity: "My new home")
        
    }
}

struct CardOutcome_Previews: PreviewProvider {
    static var previews: some View {
        CardOutcome()
    }
}
