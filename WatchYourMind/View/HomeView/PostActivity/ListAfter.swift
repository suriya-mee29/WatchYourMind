//
//  ListAfter.swift
//  WatchYourMind
//
//  Created by Gatang on 19/3/2564 BE.
//

import SwiftUI

struct PresentAfter: Identifiable {
    var id = UUID()
    var image: String
    var effectdescription: String
//    var number: Int
}
struct ActiveAfter: Identifiable {
    var id = UUID()
    var activeimage: String
//    var active: String
}



struct ListAfter: View {
    @State var username: String = ""

    
        let modelDataPresentBefore = [
            PresentAfter(image: "moon.stars.fill",effectdescription: "Hour(s) of sleep/day"),
            PresentAfter(image: "figure.walk", effectdescription: "Exercise is reduced/week")]
        
        let modelDataActiveData = [
            ActiveAfter(activeimage:"face.smiling.fill")
        ]
        

        var body: some View {
            VStack(alignment: .center) {
                Text("AFTER")
                    .font(.system(size: 40))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                VStack(alignment: .leading){
                    
                        ForEach(modelDataPresentBefore){ item in
                            HStack {
                                Image(systemName: item.image)
                                .frame(width: 50, height: 10, alignment: .leading)
                                       Text(item.effectdescription)
                                Spacer()
                             
                                TextFieldView(text: .constant(""))
                                    .shadow(radius: 5)
                                    .textContentType(.oneTimeCode)
                                       .keyboardType(.numberPad)
                                    .frame(width:90, height: 50)
                                    .fixedSize()
                                
                               }//:HSATCK
                            .padding()
                            .font(.title)
                        }//:ForEach
                        
                        ForEach(modelDataActiveData){ item in
                            HStack {
                                Image(systemName: item.activeimage)
                                    .frame( height: 10, alignment: .leading)
                                
                                TextField("Active...", text: $username)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                            }
                            .padding()
                            .font(.title)
                        }

                       }//:VStack
                    
                .frame(width: 400, alignment: .center)
     
                    .overlay(
                            RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 2))
                    .padding(.horizontal)
                  
                .shadow(radius: 30)
            }//:VSTACK
            .padding()    }
}

struct ListAfter_Previews: PreviewProvider {
    static var previews: some View {
        ListAfter()
    }
}
