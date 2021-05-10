//
//  TryView.swift
//  WatchYourMind
//
//  Created by Gatang on 9/3/2564 BE.
//

import SwiftUI

struct TryView: View {
//    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
//    let colorBackground: Color = Color("bg-1")

    var body: some View {
           
           NavigationView {
               NavigationLink(destination:  MeasurementView(user: userRequestData[1])) {
                Spacer()
                HStack(alignment: .bottom, spacing: 8) {
                    Text("NEXT")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                    Image(systemName: "chevron.forward" )
                        .font(.title)
                        .foregroundColor(.purple)
                        .font(.system(size: 25))



                }//HSTACK

    .padding(.horizontal,20)
                .padding(10)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
                .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
                .padding(.trailing,20)
               }
           }.navigationViewStyle(StackNavigationViewStyle())
           
//
        
        
        
//
//        NavigationView {
//          Group {
//            ScrollView(.vertical, showsIndicators: false) {
//              LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
//
//                VStack(alignment:. leading, spacing: 20) {
//
//                        Text("Ask for basic information before assigning activities.")
//                            .font(.system(size:30))
//                            .lineLimit(2)
//                           .foregroundColor(.gray)
//
//
//                }.padding(.horizontal,3)
//                VStack(alignment: .leading,spacing: 0){
//                        Text("Add User")
//                            .font(.system(size:50))
//                            .font(.title)
//                        Text("Presentation:")
//                            .font(.system(size:40))
//                            .foregroundColor(.gray)
//
//
//                        TextEdit()
//                            .shadow(radius: 5 )
//                            .padding(.vertical,20)
//                            .padding(.horizontal,10)
//                     Text("Percipitance:")
//                        .font(.system(size:40))
//                        .foregroundColor(.gray)
//                            CheckboxView2()
//                    }
//
//
//                VStack(alignment: .leading, spacing: 8){
//
//                    Text("Pattern:")
//                        .font(.system(size:40))
//                        .foregroundColor(.gray)
//
//
//                    TextEdit()
//                        .shadow(radius: 5 )
//                        .padding(.vertical,20)
//                        .padding(.horizontal,10)
//                    }
//                VStack(alignment: .leading, spacing: 8){
//                    Text("Intensity Level: ")
//                        .font(.system(size:40))
//                        .foregroundColor(.gray)
//                    IntensityLevelView()
//                    }
//                        VStack(alignment: .center,spacing: 30) {
//                    EmotionView()
//                        }.padding(.vertical,8)
//
//                VStack(alignment: .leading, spacing: 0){
//                            Text("Effect")
//                                .font(.system(size:40))
//                                .foregroundColor(.gray)
//                    Effects()
//
//                        }.padding(.vertical,8)
//
//                    VStack(alignment: .leading, spacing: 8){
//                            TheperiodoftheproblemView()
//
//
//                }
//                    VStack(alignment: .leading, spacing: 8){
//
//
//
//                        NavigationLink(destination: AutoActivityList()) {
//                                        HStack {
//                                            Text("NEXT")
//                                                .fontWeight(.heavy)
//                                                .foregroundColor(Color.black)
//                                            Image(systemName: "chevron.forward" )
//                                                .font(.title)
//                                                .foregroundColor(.purple)
//                                                .font(.system(size: 25))
//
//
//
//
//                                        .padding(.horizontal,20)
//                                        .padding(10)
//                                        .background(Color.white)
//                                        .cornerRadius(10)
//                                        .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
//                                        .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
//
//                         }//:HSTACK
//                        }//:NavigationLink
//                    }
//
//              }//:LAZYVGRID
//              .ignoresSafeArea(.all, edges: .top)
//            }//:SCROLL
//          } //: GROUP
//          .navigationBarTitle("PreActivity", displayMode: .large)
//
//        } //: NAVIGATION
//        .navigationViewStyle(StackNavigationViewStyle())

      }
       
       
   }

struct TryView_Previews: PreviewProvider {
    static var previews: some View {
        TryView()
    }
}
