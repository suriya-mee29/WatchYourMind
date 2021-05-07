//
//  ManualActivityFlipView.swift
//  WatchYourMind
//
//  Created by Gatang on 14/3/2564 BE.
//

import SwiftUI

struct ManualActivityFlipView: View {
    @State private var flipped = false
    @State private var animate3d = false
    @State private var circleColorChanged = true

    
    
    //Font
    let activityName: String
    let assined:String
    let create: Date
    
    //Back
    let description:String
    
    var body: some View {
//        VStack(alignment: .center, spacing: 20) {
            
            ZStack {
                Rectangle()
                    .border(circleColorChanged ? Color(.systemGray5) : Color("activeColor"),width: 40)
                     .cornerRadius(30)
//                    .padding()
//
//                    .stroke(Color.blue, lineWidth: 10)
                    .frame(width: 320, height: 170,alignment: .center)
                   
//                    .padding()
                    
                ManualActivityListFront(activityName: activityName, assined: assined, create: Date(), colorActivity: "incompleteColor").opacity(flipped ? 0.0 : 1.0)
                
                
                ManualActivityListBack(titlename: activityName, description: description).opacity(flipped ? 1.0 : 0.0)
                


            }
           
            

            
            .modifier(flipFunction( flipped : $flipped, axis:(x: 1, y: 0), angle: animate3d ? 180 : 0))
            .onTapGesture {
                self.circleColorChanged.toggle()
                withAnimation(Animation.linear(duration: 0.5)){
                    self.animate3d.toggle()
                }
            }
//        }.padding(.horizontal,50)
        
    }
}

struct ManualActivityFlipView_Previews: PreviewProvider {
    static var previews: some View {
        ManualActivityFlipView(activityName: "Music Relaxation", assined:"1", create: Date(), description: "When feeling depressed, stressed, or not relaxed From the current situation")
    }
}


