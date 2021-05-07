//
//  ManualActivityListBack.swift
//  WatchYourMind
//
//  Created by Gatang on 14/3/2564 BE.
//

import SwiftUI

struct ManualActivityListBack: View {
    let titlename: String
    let description:String
    
    var body: some View {
        VStack(alignment:.leading, spacing: 10){

                Text(titlename)
                    .font(.system(size: 30))
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("incompleteColor"))
                    .padding(.horizontal,10)

                Text(description)
                .font(.system(size: 18))
                    .padding(.horizontal,10)


        }//:VSTACK
        .frame(width: 300, height: 150, alignment: .center)
//        .padding(.horizontal,10)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 20 )    }
}

struct ManualActivityListBack_Previews: PreviewProvider {
    static var previews: some View {
        ManualActivityListBack(titlename: "Music Relaxation", description: "When feeling depressed, stressed, or not relaxed From the current situation")
    }
}
