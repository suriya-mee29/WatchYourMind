//
//  AnalysisPreactivity.swift
//  WatchYourMind
//
//  Created by Gatang on 21/3/2564 BE.
//

import SwiftUI

struct AnalysisPreactivity: View {
    public var stylepresent: ChartStyle2
    public var dropShadowpresent: Bool
    
//    var contentdate: LocalizedStringKey

    
    public init(style: ChartStyle2 = Styles.pieChartStyleOne, dropShadow: Bool? = true){
        self.stylepresent = style
        self.dropShadowpresent = dropShadow!
//        self.startdate =
    }
    var body: some View {
//        ZStack{
//            Rectangle()
//                .fill(self.stylecard.backgroundColor)
//                .cornerRadius(20)
//                .shadow(color: self.stylecard.dropShadowColor, radius: self.dropShadowcard ? 12 : 0)
            VStack{
//                 let startdate: Date

            Text("Presentation:")
                .font(.system(size:40))
                .foregroundColor(.black)
//                Text("\(startdate , format: taskdate)")
                
                
                
        
                ZStack {
                    Rectangle()
                        .fill(self.stylepresent.backgroundColor)
                        .cornerRadius(10)
                        .shadow(color: self.stylepresent.dropShadowColor, radius: self.dropShadowpresent ? 12 : 0)
                        .frame(width: 380, height:220)
                    TextEdit()
                        .cornerRadius(10)
                        .frame(width: 380, height:220)

                    
                
//                .shadow(radius: 5 )
//                .padding(.vertical,20)
//                .padding(.horizontal,10)
                
                }
                
                
            }
            
//        }//:ZSTACK
    
        }
}

struct AnalysisPreactivity_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisPreactivity()
    }
}
