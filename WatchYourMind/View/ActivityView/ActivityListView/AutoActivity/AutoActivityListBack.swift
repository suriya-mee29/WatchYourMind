//
//  AutoActivityListBack.swift
//  WatchYourMind
//
//  Created by Gatang on 9/3/2564 BE.
//

import SwiftUI

struct AutoActivityListBack: View {
    let titlename: String
    let description:String
//    let create: Date
//    let details: String
    
    var body: some View {
        VStack(alignment:.leading, spacing: 10){

                Text(titlename)
                    .font(.system(size: 30))
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.yellow)
                    .padding(.horizontal,10)

                Text(description)
                .font(.system(size: 18))
                    .padding(.horizontal,10)


        }//:VSTACK
        .frame(width: 300, height: 150, alignment: .center)
//        .padding(.horizontal,10)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 20 )
        
    }
}

struct AutoActivityListBack_Previews: PreviewProvider {
    static var previews: some View {
        AutoActivityListBack(titlename: "Mindfulness", description: "Mindfulness is the basic human ability to be fully present,aware of where we are and what we’re doing, and not overly reactive or overwhelmed by what’s going on around us.")
    }
}
