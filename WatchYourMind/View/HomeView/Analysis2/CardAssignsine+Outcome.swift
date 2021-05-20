//
//  CardAssignsine+Outcome.swift
//  WatchYourMind
//
//  Created by Gatang on 22/3/2564 BE.
//

import SwiftUI

struct CardAssignsine_Outcome: View {
    public var stylecard: ChartStyle2
    public var dropShadowcard: Bool
    @State private var isIphone : Bool = true


    
    public init(style: ChartStyle2 = Styles.pieChartStyleOne, dropShadow: Bool? = true){
        self.stylecard = style
        self.dropShadowcard = dropShadow!
    }
    var body: some View {
        
        VStack{
            if !isIphone{
                       VStack {
                           HStack (alignment: .top){
        ZStack{
            Rectangle()
                .fill(self.stylecard.backgroundColor)
                .cornerRadius(10)
                .shadow(color: self.stylecard.dropShadowColor, radius: self.dropShadowcard ? 12 : 0)
            
            
            
            HStack (alignment: .top){
            
       CardAssign()
            CardOutcome()
            }
            .padding()

        }//:ZSTACK
        .frame(width: UIScreen.Width-300, height: 300, alignment: .center)
        }//:HSTACK
    }//:VSTACK
        }//:IF
            else{
                
                ZStack{
                    Rectangle()
                        .fill(self.stylecard.backgroundColor)
                        .cornerRadius(10)
                        .shadow(color: self.stylecard.dropShadowColor, radius: self.dropShadowcard ? 12 : 0)
                    
                    CardAssign()
                }//:ZSTACK
                .frame(width: UIScreen.Width-40, height: 350, alignment: .center)
               
                
                ZStack{
                    Rectangle()
                        .fill(self.stylecard.backgroundColor)
                        .cornerRadius(10)
                        .shadow(color: self.stylecard.dropShadowColor, radius: self.dropShadowcard ? 12 : 0)
                    
                    CardOutcome()
                }//:ZSTACK
                .frame(width: UIScreen.Width-40, height: 350, alignment: .center)
                .padding(.top,30)
                
                
                
                
            }
        }//:VSTACK
        .onAppear(perform: {
            if UIDevice.current.userInterfaceIdiom == .phone{
               isIphone = true
            }else{
                isIphone = false
            }
        })
             
    }
}

struct CardAssignsine_Outcome_Previews: PreviewProvider {
    static var previews: some View {
        CardAssignsine_Outcome()
    }
}
