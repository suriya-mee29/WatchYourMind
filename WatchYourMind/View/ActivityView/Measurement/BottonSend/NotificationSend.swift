//
//  NotificationSend.swift
//  WatchYourMind
//
//  Created by Gatang on 12/5/2564 BE.
//

import SwiftUI

struct NotificationSend: View {
    @State private var showdetail:Bool = false
    var body: some View {
        NotificationSendDesign()
//            .offset(y:self.showdetail ? : UIScreen.main.bounds.height)
            .animation(.interpolatingSpring(mass:1.0,stiffness: 100.0, damping: 10,initialVelocity: 0))
        Button("SEND"){
            self.showdetail.toggle()
        }
        
    }
}

struct NotificationSend_Previews: PreviewProvider {
    static var previews: some View {
        NotificationSend()
    }
}

struct NotificationSendDesign: View {
    var body: some View {
        Text("Success ")
            .padding()
            .foregroundColor(.white)
            .padding(12)
            .frame(width:UIScreen.main.bounds.width-35,height: 79)
            
            .background(Color.green)
            .cornerRadius(8)
            .padding()
    }
}
