//
//  CardView.swift
//  WatchYourMind
//
//  Created by Gatang on 9/3/2564 BE.
//

import SwiftUI

struct AutoActivityFlipView: View {
    @State private var flipped = false
    @State private var animate3d = false
    
    //Font
    let activityName: String
    let assined:String
    let create: Date
    
    //Back
    let titlename: String
    let description:String
    
    
    
    var body: some View {
//        VStack(alignment: .leading) {
            
            ZStack {
                AutoActivityListFront(activityName: activityName, assined: assined, create: Date(), colorActivity: "completeColor").opacity(flipped ? 0.0 : 1.0)
                
                AutoActivityListBack(titlename: titlename, description: description).opacity(flipped ? 1.0 : 0.0)


            }
            .modifier(flipFunction( flipped : $flipped, axis:(x: 1, y: 0), angle: animate3d ? 180 : 0))
            .onTapGesture {
                withAnimation(Animation.linear(duration: 0.5)){
                    self.animate3d.toggle()
                }
            }
//        }.padding(.horizontal,50)
    }
}


struct AutoActivityFlipView_Previews: PreviewProvider {
    static var previews: some View {
        AutoActivityFlipView(activityName: "Fitness", assined: "32" , create: Date(), titlename: "Fitness", description: "Mindfulness is the basic human ability to be fully present,aware of where we are and what we’re doing, and not overly reactive or overwhelmed by what’s going on around us.")
}
}
