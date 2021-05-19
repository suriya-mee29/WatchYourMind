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
    


    
    public init(style: ChartStyle2 = Styles.pieChartStyleOne, dropShadow: Bool? = true){
        self.stylepresent = style
        self.dropShadowpresent = dropShadow!

    }
    var body: some View {

            VStack{


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
                    TextEdit(fullText: .constant(""))
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
