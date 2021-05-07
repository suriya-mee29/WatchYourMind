//
//  SomethingAnalysisView.swift
//  WatchYourMind
//
//  Created by Gatang on 20/3/2564 BE.
//

import SwiftUI
import SwiftUICharts

struct SomethingAnalysisView: View {
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State var animals: [Animal] = Bundle.main.decode("animals.json")
    
    public var stylecard: ChartStyle2
    public var dropShadowcard: Bool

    
    public init(style: ChartStyle2 = Styles.pieChartStyleOne, dropShadow: Bool? = true){
        self.stylecard = style

        self.dropShadowcard = dropShadow!
    }
    
    
    let chartStylesleep = ChartStyle(backgroundColor: Color.white, accentColor: Color(hexString: "#3CFCF0"), secondGradientColor: Color(hexString: "#3CFCF0"), textColor: Color(hexString: "#3CFCF0"), legendTextColor: Color(hexString: "#3CFCF0"), dropShadowColor: Color.gray)
    
    let chartStylemove = ChartStyle(backgroundColor: Color.white, accentColor: Color(hexString: "#A6FF00"), secondGradientColor: Color(hexString: "#A6FF00"), textColor: Color(hexString: "#A6FF00"), legendTextColor: Color(hexString: "#A6FF00"), dropShadowColor: Color.gray)
    
    let chartStylestand = ChartStyle(backgroundColor: Color.white, accentColor: Color(hexString: "#FD713C"), secondGradientColor: Color(hexString: "#FD713C"), textColor: Color(hexString: "#FD713C"), legendTextColor: Color(hexString: "#FD713C"), dropShadowColor: Color.gray)
    
    let chartStylestep = ChartStyle(backgroundColor: Color.white, accentColor: Color(hexString: "#ED117B"), secondGradientColor: Color(hexString: "#ED117B"), textColor: Color(hexString: "#ED117B"), legendTextColor: Color(hexString: "#ED117B"), dropShadowColor: Color.gray)
    
//    public var stylecard: ChartStyle2
//    public var dropShadowcard: Bool
    @State private var isIphone : Bool = true


    
//    public init(style: ChartStyle2 = Styles.pieChartStyleOne, dropShadow: Bool? = true){
//        self.stylecard = style
//        self.dropShadowcard = dropShadow!
//    }
    

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
        VStack{
            if !isIphone{
                VStack {
                    HStack (alignment: .top){
                    CardUser()
                        .padding(.top,85)
//                        .padding()
                        PieChartView()
                            .padding(.top,85)

                    }//:HSATCK
                    
                    Text("Timeline indicartors")
                        .font(.system(size:40))
                        .foregroundColor(.black)
                        .padding(.top,30)
                    ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        BarChartView(data: ChartData(values: [("Sun",63150), ("Mon",50900), ("Tue",50900), ("Wen",50900), ("Thu",50900), ("Fri",50900), ("Sat",50900)]), title: "Sleeping", style: chartStylesleep, form: CGSize(width: 300, height: 420), cornerImage:Image(systemName: "bed.double.fill"))
                            .environment(\.colorScheme, .light)
                            .padding(.trailing,10)


                BarChartView(data: ChartData(values: [("Sun",63150), ("Mon",50900), ("Tue",50900), ("Wen",50900), ("Thu",50900), ("Fri",50900), ("Sat",50900)]), title: "Moving", style: chartStylemove, form: CGSize(width: 300, height: 420), cornerImage:Image(systemName: "flame.fill"))
                    .environment(\.colorScheme, .light)
                    .padding(.trailing,10)

//                    }.padding(.vertical)
                
//                HStack {form: CGSize(width: 300, height: 420),
                    BarChartView(data: ChartData(values: [("Sun",63150), ("Mon",50900), ("Tue",50900), ("Wen",50900), ("Thu",50900), ("Fri",50900), ("Sat",50900)]), title: "Standing", style: chartStylestand, form: CGSize(width: 300, height: 420), cornerImage:Image(systemName: "figure.stand"))
                        .environment(\.colorScheme, .light)
                        .padding(.trailing,10)


                BarChartView(data: ChartData(values: [("Sun",63150), ("Mon",50900), ("Tue",50900), ("Wen",50900), ("Thu",50900), ("Fri",50900), ("Sat",50900)]), title: "Steping", style: chartStylestep, form: CGSize(width: 300, height: 420), cornerImage:Image(systemName: "figure.walk"))
                    .environment(\.colorScheme, .light)
                }//:HSTACK
                    .padding()
                        
                    }//:SCROLLVIEW
                    .frame(width: UIScreen.Width)
                    
                }//VSTACK
                
                
            } //:IF
            else{
                VStack {
                    CardUser()
                    AnalysisPreactivity()
                    Text("Timeline indicartors")
                        .font(.system(size:40))
                        .foregroundColor(.black)
                    HStack {
                        BarChartView(data: ChartData(values: [("Sun",63150), ("Mon",50900), ("Tue",50900), ("Wen",50900), ("Thu",50900), ("Fri",50900), ("Sat",50900)]), title: "Sleeping", style: chartStylesleep, cornerImage:Image(systemName: "bed.double.fill"))
                            .environment(\.colorScheme, .light)
                            .padding(.trailing,10)


                BarChartView(data: ChartData(values: [("Sun",63150), ("Mon",50900), ("Tue",50900), ("Wen",50900), ("Thu",50900), ("Fri",50900), ("Sat",50900)]), title: "Moving", style: chartStylemove, cornerImage:Image(systemName: "flame.fill"))
                    .environment(\.colorScheme, .light)
                    }.padding(.vertical)
                    
                    HStack {
                        BarChartView(data: ChartData(values: [("Sun",63150), ("Mon",50900), ("Tue",50900), ("Wen",50900), ("Thu",50900), ("Fri",50900), ("Sat",50900)]), title: "Standing", style: chartStylestand, cornerImage:Image(systemName: "figure.stand"))
                            .environment(\.colorScheme, .light)

                    BarChartView(data: ChartData(values: [("Sun",63150), ("Mon",50900), ("Tue",50900), ("Wen",50900), ("Thu",50900), ("Fri",50900), ("Sat",50900)]), title: "Steping", style: chartStylestep, cornerImage:Image(systemName: "figure.walk"))
                        .environment(\.colorScheme, .light)
                    }
                } .frame(width: UIScreen.Width)
                

            }//:else
            
            CardAssignsine_Outcome()
                .padding(.top,50)
//            ZStack{
//                Rectangle()
//                    .fill(self.stylecard.backgroundColor)
//                    .cornerRadius(10)
//                    .shadow(color: self.stylecard.dropShadowColor, radius: self.dropShadowcard ? 12 : 0)
                    
                
                Text("Activity history")
                    .font(.system(size: 30))
                    .font(.title)
//                    .fontWeight(.bold)
//                            .font(.system(size: 20))
//                        font(.headline)
//                            .padding(.bottom)
                    .padding(.top,100)
                
                ZStack {
                    Rectangle()
                        .fill(self.stylecard.backgroundColor)
                        .cornerRadius(20)
                        .shadow(color: self.stylecard.dropShadowColor, radius: self.dropShadowcard ? 12 : 0)
//                            TableListUser(animals: self.animals)
                    TableListUser2()
                        .clipShape(RoundedRectangle(cornerRadius: 30))
//                                .shadow(radius: 10 )
                        .frame(width:900)
//                        .padding()
                }
                .frame(width: UIScreen.Width-20,height: UIScreen.Height-500)
//            }//:ZSTACK
//            .padding(.top,70)

            .padding(.horizontal)

        }//:VSTACK
        .onAppear(perform: {
            if UIDevice.current.userInterfaceIdiom == .phone{
               isIphone = true
            }else{
                isIphone = false
            }
        })//:onAppear
//        LineChartView(data: [8,23,54,32,12,37,7,23,43], title: "Line chart", legend: "Basic",form: CGSize(width: 500, height: 100))
        

        
        }
//        NavigationView {
        

    }
}


struct SomethingAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        SomethingAnalysisView()
            .previewLayout(.fixed(width: 1000, height: 2000))
    }
}
//
