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
    var body: some View {
       
        VStack(alignment:.center, spacing: 10){
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment:.center){
                Text("Range indicators")
                    .font(.system(size: 30))
                    .font(.headline)
                    .foregroundColor(Color.black)
                    .padding(.horizontal,10)
            
      
            GridPickerMeasure2()
                
            
            Text("Frequency")
                .font(.system(size: 30))
                .font(.headline)
                .foregroundColor(Color.black)
                .padding(.horizontal,10)
            
            SomeDayEveryDayView()
                    .padding(.horizontal,10)
                }//:VSTACK
            }//:ScrollView
        }//:VSTACK
        .padding(.top,70)
        .frame(width: 400, height: 500,alignment: .center)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(radius: 10 )
    
        
    }
}

struct MeasureBack_Previews: PreviewProvider {
    static var previews: some View {
        MeasureBack()
    }
}
