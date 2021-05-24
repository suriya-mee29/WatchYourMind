//
//  EmotionView.swift
//  WatchYourMind
//
//  Created by Gatang on 4/3/2564 BE.
//

import SwiftUI

struct EmotionView: View {
    @Binding var selected : String
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text("Emotion Level: ")
                .font(.system(size:40))
                .foregroundColor(.black)
                .padding(.bottom,30)
//                .padding(.leading)
             
        HStack{
           
            
            EmotionLevelGroup{
                selected in
                print("\(selected)")
                self.selected = selected
            }
//            .padding(.horizontal,20)
        }
        }

//        .frame(width: .infinity)
        
    }
}

struct EmotionView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionView(selected: .constant("")).previewLayout(.sizeThatFits)
    }
}
