//
//  SomethingAnalysisView.swift
//  WatchYourMind
//
//  Created by Gatang on 20/3/2564 BE.
//

import SwiftUI
import SwiftUICharts

class somethingAnalysis: ObservableObject {
  @Published var showingPage: Bool = false
  @Published var selectedPage: DefineAfterView? //= nil
}



struct SomethingAnalysisView: View {
    
    
    let feedback = UIImpactFeedbackGenerator(style: .heavy)
    @EnvironmentObject var somethingAnaly: somethingAnalysis
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
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


    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
        ZStack{
            if somethingAnaly.showingPage == false  {
            VStack {
        VStack(spacing: 0){
            HStack{
                Spacer()

                    
                ZStack {
                    
                   
                Button(action: {
                }, label: {
//                            Image(systemName: "person.badge.plus")
                    Image(systemName: "chevron.right")
                        .font(.system(size: 26))
                        .scaledToFit()
                         .fixedSize()
                         .foregroundColor(.black)
                         
                        .frame(width: 20, height: 20)
                        .padding()
                        .background(Color.white)
                        .frame(width: 40, height: 40)
                        .cornerRadius(100)
                        .onTapGesture {
                          feedback.impactOccurred()
                            somethingAnaly.showingPage = true
                        }
                }) //: BUTTON-BELL
                }//:ZSTACK
                .padding(.trailing,50)
//                    Spacer()
                
                .frame( height: 80)
                
            }//:HSTACK
            .background(Color.purple)
            .edgesIgnoringSafeArea(.all)
            
        }
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.purple)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                
                VStack{
                                    if !isIphone{
                                        VStack {

                                            HStack (alignment: .top){
                                                VStack{
                                            CardUser()
                                                .padding(.top,85)
                       
                                                }
                                                PieChartView()
                                                    .padding(.top,85)

                                            }//:HSATCK
                                            CardAssignsine_Outcome()
                                                .padding(.top,90)

                                            Text("Timeline indicartors")
                                                .font(.system(size:40))
                                                .foregroundColor(.black)
                                                .padding(.top,90)
                                            ScrollView(.horizontal, showsIndicators: false) {
                                            HStack {
                                                BarChartView(data: ChartData(values: [("Sun",63150), ("Mon",50900), ("Tue",50900), ("Wen",50900), ("Thu",50900), ("Fri",50900), ("Sat",50900)]), title: "Sleeping", style: chartStylesleep, form: CGSize(width: 300, height: 420), cornerImage:Image(systemName: "bed.double.fill"))
                                                    .environment(\.colorScheme, .light)
                                                    .padding(.trailing,10)


                                        BarChartView(data: ChartData(values: [("Sun",63150), ("Mon",50900), ("Tue",50900), ("Wen",50900), ("Thu",50900), ("Fri",50900), ("Sat",50900)]), title: "Moving", style: chartStylemove, form: CGSize(width: 300, height: 420), cornerImage:Image(systemName: "flame.fill"))
                                            .environment(\.colorScheme, .light)
                                            .padding(.trailing,10)

                                            BarChartView(data: ChartData(values: [("Sun",63150), ("Mon",50900), ("Tue",50900), ("Wen",50900), ("Thu",50900), ("Fri",50900), ("Sat",50900)]), title: "Standing", style: chartStylestand, form: CGSize(width: 300, height: 420), cornerImage:Image(systemName: "figure.stand"))
                                                .environment(\.colorScheme, .light)
                                                .padding(.trailing,10)


                                        BarChartView(data: ChartData(values: [("Sun",63150), ("Mon",50900), ("Tue",50900), ("Wen",50900), ("Thu",50900), ("Fri",50900), ("Sat",50900)]), title: "Steping", style: chartStylestep, form: CGSize(width: 300, height: 420), cornerImage:Image(systemName: "figure.walk"))
                                            .environment(\.colorScheme, .light)
                                        }//:HSTACK
                                            .padding(.horizontal,30)
                                            .padding(.vertical)

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

                                }//:VSTACK
            }
                
                
                .onAppear(perform: {
                    if UIDevice.current.userInterfaceIdiom == .phone{
                       isIphone = true
                    }else{
                        isIphone = false
                    }
                })//:onAppear
                
            }
            else{
                DefineAfterView(iSSave: .constant(false))
            }

        
        }//:ZSTACK
        .ignoresSafeArea(.all, edges: .top)
        })
        .ignoresSafeArea(.all, edges: .top)
    }
}


struct SomethingAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        SomethingAnalysisView()
            .previewLayout(.sizeThatFits)
            .environmentObject(somethingAnalysis())
    }
}
//


