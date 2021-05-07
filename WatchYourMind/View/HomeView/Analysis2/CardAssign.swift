//
//  CardAssign.swift
//  WatchYourMind
//
//  Created by Gatang on 22/3/2564 BE.
//

import SwiftUI

struct BuidCardAssign: View {
    let nameActivity: String
    let descriptionActivity: String
    let dategetActivity: Date
 
    
    
    var body: some View {
        VStack(alignment: .leading,spacing: 8) {
            Text(nameActivity)
                .font(.system(size: 30))
                .padding(.leading)
            Text(descriptionActivity)
                .lineLimit(5)
                .frame(width:350)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(.gray)
                .padding(.leading)
            Text("\(dategetActivity)")
                .frame(width:350)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.leading)

                
                ProgressBarView(value: CGFloat(60), color: Color.red)
                    .frame(width: 100, height: 100)
                    .padding(.leading,150)
            
        }
        
    }
}
struct CardAssign: View {
//    public var stylecard: ChartStyle2
//    public var dropShadowcard: Bool
//
//
//    public init(style: ChartStyle2 = Styles.pieChartStyleOne, dropShadow: Bool? = true){
//        self.stylecard = style
//
//        self.dropShadowcard = dropShadow!
//    }
    var body: some View {
//
//        ZStack{
//            Rectangle()
//                .fill(self.stylecard.backgroundColor)
//                .cornerRadius(10)
//                .shadow(color: self.stylecard.dropShadowColor, radius: self.dropShadowcard ? 12 : 0)
        BuidCardAssign(nameActivity: "Drawing", descriptionActivity: "Drawing can be very therapeutic for the mind and soul. In general, enjoying drawing and art also can be a stress-reliever because it makes you escape your real problems.", dategetActivity: Date())
        //        }//:ZSTACK
//        .frame(width:380,height: 220)
       
    }
}

struct CardAssign_Previews: PreviewProvider {
    static var previews: some View {
        CardAssign()
    }
}
