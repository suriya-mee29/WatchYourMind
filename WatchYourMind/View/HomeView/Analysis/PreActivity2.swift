//
//  PreActivity2.swift
//  WatchYourMind
//
//  Created by Gatang on 16/4/2564 BE.
//

import SwiftUI

struct PreActivity2: View {
    let colorBackground: Color = Color("bg-1")
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State var isNavigationBarHidden: Bool = true
    @State var eff : String? = ""
    
//    @State var next = "NEXT"

    var body: some View {
       
        
        NavigationView {
            ZStack {

              
          Group {
            ScrollView(.vertical, showsIndicators: false) {
              LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                
                VStack(alignment:. leading, spacing: 20) {
                    
                        Text("Ask for basic information before assigning activities.")
                            .font(.system(size:30))
                            .lineLimit(2)
                           .foregroundColor(.black)
                    

                }.padding(.horizontal,3)
                VStack(alignment: .leading,spacing: 0){
                        Text("Add User")
                            .font(.system(size:50))
                            .font(.title)
                        Text("Presentation:")
                            .font(.system(size:40))
                            .foregroundColor(.black)
                            
                    
                    TextEdit(fullText: .constant(""))
                            .shadow(radius: 5 )
                            .padding(.vertical,20)
                            .padding(.horizontal,10)
                     Text("Percipitance:")
                        .font(.system(size:40))
                        .foregroundColor(.black)
                    CheckboxView2(precipitance: .constant(["ddd" : ["String" : false]]))
                    }

    
                VStack(alignment: .leading, spacing: 8){

                    Text("Pattern:")
                        .font(.system(size:40))
                        .foregroundColor(.black)
                        
                
                    TextEdit(fullText: .constant(""))
                        .shadow(radius: 5 )
                        .padding(.vertical,20)
                        .padding(.horizontal,10)
                    }
                VStack(alignment: .leading, spacing: 8){
                    Text("Intensity Level: ")
                        .font(.system(size:40))
                        .foregroundColor(.gray)
                    IntensityLevelView(sliderValue: .constant(50))
                    }
                        VStack(alignment: .center,spacing: 30) {
                            EmotionView(selected: .constant(""))
                        }.padding(.vertical,8)
                    
                VStack(alignment: .leading, spacing: 0){
                            Text("Effect")
                                .font(.system(size:40))
                                .foregroundColor(.gray)
                    Effects(selectedActivity: self.$eff, checklistItems: .constant([]))
                    TheperiodoftheproblemView(text: .constant(""))

                        }
                    VStack(alignment: .leading, spacing: 8){
//                        NavigationLink(destination: SomethingAnalysisView()) {
//                         Spacer()
//                         HStack(alignment: .bottom) {
//
//                             Image(systemName: "chevron.forward" )
//                                 .font(.title)
//                                 .foregroundColor(.purple)
//                                 .font(.system(size: 25))
//                            
////
//
//
//                         }//HSTACK
//
//             .padding(.horizontal,20)
//                         .padding(10)
//                         .background(Color.white)
//                         .clipShape(Circle())
//                         .cornerRadius(10)
//                         .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
//                         .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
//                         .padding(.trailing,20)
//                         .padding(.vertical,10)
//                         
//                                        
//                        }//:NavigationLink
                        
                    }//:VStack

              }//:LAZYVGRID
              .ignoresSafeArea(.all, edges: .top)
            }//:SCROLL
          } //: GROUP
          .navigationBarTitle("PreActivity", displayMode:.large)
            }//:ZSatck
        } //: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct PreActivity2_Previews: PreviewProvider {
    static var previews: some View {
        PreActivity2()
    }
}
