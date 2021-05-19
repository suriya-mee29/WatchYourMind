//
//  MeasureBack.swift
//  WatchYourMind
//
//  Created by Gatang on 17/3/2564 BE.
//

import SwiftUI
extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct MeasureBack: View {
    @Binding var activity : [ActivityModel]
    let seletedAnActivity : ActivityModel
    @State var num : Int = 0
    
    
    var body: some View {
            VStack(alignment:.leading){
               
                        Text("Frequency")
                            .font(.system(size: 30))
                            .font(.headline)
                            .foregroundColor(Color.black)
                            .padding(.horizontal,30)
                            
                        
                SomeDayEveryDayView(activity: self.$activity , seletedAnActivity: self.seletedAnActivity)
                                .padding(.horizontal,65)
                        
                        
                             Text("Range indicators")
                                 .font(.system(size: 30))
                                 .font(.headline)
                                 .foregroundColor(Color.black)
                                 .padding(.horizontal,30)
                         
                   
                         GridPickerMeasure2(activity: self.$activity , seletedAnActivity: self.seletedAnActivity)
                            .padding(.bottom)
                   
                
               
                
            }//:VSTACK
           
            .frame(width: 400, height: 600,alignment: .center)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(radius: 10 )

        
    }
}

struct MeasureBack_Previews: PreviewProvider {
    static var previews: some View {
        MeasureBack(activity: .constant([]), seletedAnActivity: ActivityModel(createdby: "koi", description: "hello hello", imageIcon: "gamer", title: "Music Relexation1", type: "MANUAL", createdDate: Date(), dockey: "key"))
    }
}
