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
    
    
     let event : String = "Hello Event"
    let presentation : String = "Hello Presentation"
    let internalfactor: String = "Hello Internal Factor"
    let externalfactor: String = "Hello External Factor"
    let pattern : String = "Hello Pattern"
    let faultythinking: String = "Hello Faulty Thinking"
    let intensitylevel: String = "50"
    let emotionlevel: String = "😆"
    let hoursOfsleep: String = "5"
    let hoursOfexercise: String = "3"
    let active: String = "hyperactive"
    
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
//            if somethingAnaly.showingPage == false  {
            VStack {
        VStack(spacing: 0){
            HStack{
                Spacer()

                    
                ZStack {
                    
                   
                Button(action: {
                }, label: {
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
//        .fixedSize()
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.purple)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)

                
                VStack(alignment:.center){
//                                    if !isIphone{
//                                        VStack {

                                            HStack (alignment: .top){
                                            CardUser()
                                                .padding(.top,85)
                                                PieChartView()
                                                    .padding(.top,85)
                                            }//:HSATCK
                                            VStack(alignment:.leading){
                                            Text("HomeWork")
                                                .font(.system(size:40))
                                                .foregroundColor(.black)
                                                .padding(.top,90)
                                            CardAssignsine_Outcome() .padding(.top,50)
                                            }
                                               
                                            VStack(alignment:.leading){
                                            Text("Timeline indicartors")
                                                .font(.system(size:40))
                                                .foregroundColor(.black)
                                                .padding(.top,90)
                                                .padding(.leading)
                                               
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
                                            .padding(.horizontal)
                                            .padding(.vertical)

                                            }//:SCROLLVIEW
                                            .frame(width: UIScreen.Width)
                                            }//:VSTACK

                    
                    
                    
                    
                   
                    ZStack{
                        Rectangle()
                            .fill(self.stylecard.backgroundColor)
                            .cornerRadius(10)
                            .shadow(color: self.stylecard.dropShadowColor, radius: self.dropShadowcard ? 12 : 0)
                        VStack{

//                            VStack(alignment: .leading){
                                            Text("Preactivity")
                                                .font(.system(size:50))
                                                .foregroundColor(.black)
                                                .padding(.top,30)
//                                                .padding(.leading)
//                            }
                    VStack{
                        Text("Event:")
                            .font(.system(size:45))
                        Text("\(event)")
                        Text("Presentation:")
                            .font(.system(size:45))
                        Text("\(presentation)")
     
                    }

                            
                    Text("Percipitance:")
                        .font(.system(size:45))
                        .padding(.leading)
                        .padding(.top,50)
                    
                    HStack(alignment:.center){
                        Spacer()
                        VStack{
                            
                            Text("Internal Factor:")
                                .font(.system(size: 30))
                            Text("\(internalfactor)")
                                .font(.system(size: 25))
                            
                        }
                        Divider()
                            .background(Color.purple)
                            .frame(width:20,height:80)
                        
                        VStack{
                            
                            Text("External Factor:")
                                .font(.system(size: 30))
                            Text("\(externalfactor)")
                                .font(.system(size: 25))
                            
                        }
                        Spacer()
                        
                        
                    }
                    .padding(.bottom,50)
                    
                    
                    VStack{
                            Text("Pattern:")
                            .font(.system(size:45))
                            
                        Text("\(pattern)")
                         
//                        }
                        
                        VStack{
                            Text("Faulty Thinking")
                            .font(.system(size:45))
//
                        Text("\(faultythinking)")
                          
                    }
                    .padding(.horizontal)
                    }
                    .fixedSize()
                    .padding(.leading)
                    
                    HStack(alignment:.center){
                    HStack{ 
                        Spacer()
                        Text("Intensity Level: ")
                            .font(.system(size:45))
//                            .padding(.top,50)
                        Text("\(intensitylevel)")
                            .font(.system(size: 55))
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.purple)
                        
                    }
                    .padding(.top,50)
                    .padding(.leading)
                        
                        HStack{
                            Text("Emotion Level: ")
                                .font(.system(size:45))
    //                            .padding(.top,50)
                            Text("\(emotionlevel)")
                                .font(.system(size: 55))
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.purple)
                            Spacer()
                        }
                        .padding(.top,50)
                        .padding(.leading)
                    }
                    
                    VStack{
                        Text("Other")
                            .font(.system(size:45))
                        HStack{
                            
                        Text("Hour(s) of sleep / day")
                            .font(.system(size: 30))
                            Text("\(hoursOfsleep)")
                                .font(.system(size: 50))
                                .foregroundColor(.purple)
                            

                        }
                        HStack{
                           
                            Text("Exercise is reduced / week")
                            .font(.system(size: 30))
                            Text("\(hoursOfsleep)")
                                .font(.system(size: 50))
                                .foregroundColor(.purple)
                        }
                        
                        HStack{
                           
                            Text("Active")
                            .font(.system(size: 30))
                            Text("\(active)")
                                .font(.system(size: 50))
                                .foregroundColor(.purple)
                        }

                        
                    } .padding(.top,50)
                    
                    }//:VStack
                        

                    }//;ZSTACk
                    .frame(width:UIScreen.Width-40)
                   
                    ZStack{
                        Rectangle()
                            .fill(self.stylecard.backgroundColor)
                            .cornerRadius(10)
                            .shadow(color: self.stylecard.dropShadowColor, radius: self.dropShadowcard ? 12 : 0)
                    DefineAfterView(iSSave: .constant(false))
                        .padding(.top,50)
                    }
                    .frame(width:UIScreen.Width-40)
                    .padding(.top,30)
                    .padding(.bottom,30)
                        
                   

                                            
                                            
                                            
//                                        }//VSTACK


//                                    } //:IF
//                                    else{
//                                        VStack {
//                                            CardUser()
//                                            AnalysisPreactivity()
//                                            Text("Timeline indicartors")
//                                                .font(.system(size:40))
//                                                .foregroundColor(.black)
//                                            HStack {
//                                                BarChartView(data: ChartData(values: [("Sun",63150), ("Mon",50900), ("Tue",50900), ("Wen",50900), ("Thu",50900), ("Fri",50900), ("Sat",50900)]), title: "Sleeping", style: chartStylesleep, cornerImage:Image(systemName: "bed.double.fill"))
//                                                    .environment(\.colorScheme, .light)
//                                                    .padding(.trailing,10)
//
//
//                                        BarChartView(data: ChartData(values: [("Sun",63150), ("Mon",50900), ("Tue",50900), ("Wen",50900), ("Thu",50900), ("Fri",50900), ("Sat",50900)]), title: "Moving", style: chartStylemove, cornerImage:Image(systemName: "flame.fill"))
//                                            .environment(\.colorScheme, .light)
//                                            }.padding(.vertical)
//
//                                            HStack {
//                                                BarChartView(data: ChartData(values: [("Sun",63150), ("Mon",50900), ("Tue",50900), ("Wen",50900), ("Thu",50900), ("Fri",50900), ("Sat",50900)]), title: "Standing", style: chartStylestand, cornerImage:Image(systemName: "figure.stand"))
//                                                    .environment(\.colorScheme, .light)
//
//                                            BarChartView(data: ChartData(values: [("Sun",63150), ("Mon",50900), ("Tue",50900), ("Wen",50900), ("Thu",50900), ("Fri",50900), ("Sat",50900)]), title: "Steping", style: chartStylestep, cornerImage:Image(systemName: "figure.walk"))
//                                                .environment(\.colorScheme, .light)
//                                            }
//                                        } .frame(width: UIScreen.Width)
//
//
//                                    }//:else
//                    VStack(alignment:.leading){
                        
                    

                        
//                        }//:HSTACK
                        
//                                }//:VSTACK
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }
            }
                
                
                .onAppear(perform: {
                    if UIDevice.current.userInterfaceIdiom == .phone{
                       isIphone = true
                    }else{
                        isIphone = false
                    }
                })//:onAppear
                
//            }
//            else{
//                DefineAfterView(iSSave: .constant(false))
//            }

        
        }//:ZSTACK
//        .ignoresSafeArea(.all, edges: .top)
        })//:SCROLLVIEW
        .ignoresSafeArea(.all, edges: .top)
    }
}


struct SomethingAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        SomethingAnalysisView()
//            .previewLayout(.fixed(width: 2000, height: 1500))
            .environmentObject(somethingAnalysis())
        
    }
}

