//
//  buttonPreActivity.swift
//  WatchYourMind
//
//  Created by Gatang on 11/3/2564 BE.
//

import SwiftUI

struct buttonPreActivity: View {
//    @State var next = false
    @State private var next: Bool = false
    var body: some View {
        NavigationView{
        VStack(alignment: .leading, spacing: 8){
            NavigationLink(destination:  MeasurementView(user: userRequestData[1])) {
             Spacer()
             HStack(alignment: .bottom) {
                 Text("NEXT")
                     .fontWeight(.heavy)
                     .foregroundColor(Color.black)
                 Image(systemName: "chevron.forward" )
                     .font(.title)
                     .foregroundColor(.purple)
                     .font(.system(size: 25))

             }//:HSTACK

 .padding(.horizontal,20)
             .padding(10)
             .background(Color.white)
             .cornerRadius(10)
             .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
             .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
             .padding(.trailing,20)
             .padding(.vertical,10)
             
                            
            }//:NavigationLink
        }//:VStack
        }//:NavigationView
    }
}

struct buttonPreActivity_Previews: PreviewProvider {
    static var previews: some View {
        buttonPreActivity().previewLayout(.sizeThatFits)
    }
}
