//
//  EmotionRadioField.swift
//  WatchYourMind
//
//  Created by Gatang on 4/3/2564 BE.
//

import SwiftUI

struct EmotionRadioField: View {
    let idEmotion: String
       let labelEmotion: String
       let sizeEmotion: CGFloat
       let colorEmotion: Color
       let textSizeEmotion: CGFloat
       let isMarkedEmotion:Bool
       let callbackEmotion: (String)->()
    let hapicImpact = UIImpactFeedbackGenerator(style: .medium)
       
       init(
            id: String,
           label:String,
           size: CGFloat = 60,
           color: Color = Color.purple,
           textSize: CGFloat = 60,
           isMarked: Bool = false,
           callback: @escaping (String)->()
           ) {
           self.idEmotion = id
           self.labelEmotion = label
           self.sizeEmotion = size
           self.colorEmotion = color
           self.textSizeEmotion = textSize
           self.isMarkedEmotion = isMarked
           self.callbackEmotion = callback
       }
    var body: some View {
        HStack(alignment:.center){
           Button(action:{
               self.callbackEmotion(self.idEmotion)
            hapicImpact.impactOccurred()
           }) {
            VStack(alignment: .center,spacing: 5) {
                   Image(systemName: self.isMarkedEmotion ? "largecircle.fill.circle" : "circle")
//                       .renderingMode(.original)
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)

//                       .frame(width: self.sizeEmotion, height: self.sizeEmotion)
                    .accentColor(.purple)
                Text(labelEmotion)
                       .font(Font.system(size: 50))
//                    .font(.system(size:100))
                  
               }.foregroundColor(.purple)

           }
//           .frame(width: .infinity)
           .foregroundColor(Color.white)
        }
        
        Spacer()

    }
}

//struct EmotionRadioField_Previews: PreviewProvider {
//   static func radioCallback(id: String) {
//
//    }
//
//    static var previews: some View {
//        EmotionRadioField(id: "no", label: "no", callback: radioCallback(id: ""))
//    }
//}
