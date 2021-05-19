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
    @Binding var selectedActivities : [ActivityModel]
    
    
    let currentActivity : ActivityModel

    
    

    
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
                    
                ManualActivityListFront(activityName: currentActivity.title, assined: "\(currentActivity.count)", create: currentActivity.createdDate, colorActivity: "incompleteColor").opacity(flipped ? 0.0 : 1.0)
                
                
                ManualActivityListBack(titlename: currentActivity.title, description: currentActivity.description).opacity(flipped ? 1.0 : 0.0)
                


            }
           
            

            
            .modifier(flipFunction( flipped : $flipped, axis:(x: 1, y: 0), angle: animate3d ? 180 : 0))
            .onTapGesture {
                self.circleColorChanged.toggle()
                withAnimation(Animation.linear(duration: 0.5)){
                    self.animate3d.toggle()
                }
              
                
                if self.circleColorChanged == true{
                    if self.selectedActivities.count != 0{
                        print("count \(selectedActivities.count)")
                        for i in 0...(self.selectedActivities.count-1){
                            if self.selectedActivities[i].dockey == self.currentActivity.dockey {
                                self.selectedActivities.remove(at: i)
                                break
                            }
                        }
                    }
                    print("remove")
                    print("count after remove \(selectedActivities.count)")
                }else{
                    self.selectedActivities.append(currentActivity)
                    print("append --> count \(selectedActivities.count)")
                    
                }
                
            }
//        }.padding(.horizontal,50)
        
    }
}

struct ManualActivityFlipView_Previews: PreviewProvider {
    static var previews: some View {
        ManualActivityFlipView(selectedActivities: .constant([]), currentActivity: ActivityModel(createdby: "", description: "", imageIcon: "", title: "", type: "", createdDate: Date(), dockey: ""))
    }
}


