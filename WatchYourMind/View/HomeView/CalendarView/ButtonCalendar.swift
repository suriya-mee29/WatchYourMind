//
//  ButtonCalendar.swift
//  WatchYourMind
//
//  Created by Gatang on 25/2/2564 BE.
//

import SwiftUI

struct ButtonCalendar: View {
    var body: some View {
        Button(action:{
//            print("Exit the onboarding")
        }){
            HStack (spacing:8){
//                Text("Start")
                
                Image(systemName: "calendar.badge.clock")
                    .foregroundColor(.black)
                    .imageScale(.large)
                    .font(.system(size: 30))
                    
                    
            }
//            .padding(.horizontal,5)
//            .padding(.vertical,5)
//            .background(Circle().strokeBorder(Color.black,lineWidth: 1.25))
        }//:BUTTON
        .background(Color.white)
//        .foregroundColor(.white) //หรือจะใช้.accentColor(Color.white)ก็ได้เหมือนกัน
    
    }
}

struct ButtonCalendar_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCalendar().previewLayout(.sizeThatFits)
    }
}
