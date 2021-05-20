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

    
//    @State var next = "NEXT"

    var body: some View {
        
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
               
          LazyVGrid(columns: gridLayout, alignment: .leading, spacing: 10) {

            VStack(alignment:. leading, spacing: 20) {

                    Text("Preactivity")
                        .font(.system(size: 50))
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.leading)


            }.padding(.horizontal,3)
            VStack(alignment: .leading,spacing: 0){
                   
                    Text("Presentation:")
                        .font(.system(size:40))
                        .foregroundColor(.black)


                TextEdit()
                        .shadow(radius: 5 )
                        .padding(.vertical,20)
                        .padding(.horizontal,10)
//                    .frame(width: 500)
                 
            }
            VStack(alignment:.leading){
                Text("Percipitance:")
                .font(.system(size:40))
                .foregroundColor(.black)
                    .padding(.leading)
//                        .padding(.bottom,20)
            CheckboxView2()
                .frame(width: 570)
//                .fixedSize()
                .padding(.leading,69)
                
            }
            
//                .paddin       g()
//            .padding(.leading)
            
//            .padding(.horizontal,100)
            


            VStack(alignment: .leading, spacing: 8){

                Text("Pattern:")
                    .font(.system(size:40))
                    .foregroundColor(.black)


                TextEdit()
                    .shadow(radius: 5 )
                    .padding(.vertical,20)
                    .padding(.horizontal,10)
                }
            .padding(.bottom,30)
            .padding()
            VStack(alignment: .leading, spacing: 8){
            Text("Faulty Thinking")
                .font(.system(size:40))//                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(.leading)
            TextEdit()
                .shadow(radius: 5 )
                .padding(.horizontal,10)
            }.padding()
            .padding(.bottom,30)
            VStack(alignment: .leading, spacing: 8){
                Text("Intensity Level: ")
                    .font(.system(size:40))
                    .foregroundColor(.black)
                    .padding(.bottom,30)
                IntensityLevelView()
            }.padding()
            .padding(.bottom,30)
            ScrollView(.horizontal, showsIndicators: false) {
                VStack(alignment: .leading,spacing: 30) {
                        
                EmotionView()
            }
            }
//                    }.padding()

            VStack(alignment: .leading, spacing: 0){
                        Text("Effect")
                            .font(.system(size:40))
                            .foregroundColor(.black)
                            .padding(.bottom,30)
                Effects()
                TheperiodoftheproblemView()

                    }
          }//:LAZYVGRID

          }//SCROLL
          .ignoresSafeArea(.all, edges: .top)
        }
//        NavigationView {
//            ZStack {
//
//
//          Group {
//            ScrollView(.vertical, showsIndicators: false) {
//              LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
//
//                VStack(alignment:. leading, spacing: 20) {
//
//                        Text("PreActivity")
//                            .font(.system(size: 50))
//                            .font(.headline)
//                            .fontWeight(.bold)
//                            .padding(.leading)
//                            .padding(.bottom,30)
//
//
//                }.padding(.horizontal,3)
//                VStack(alignment: .leading,spacing: 0){
//                        Text("Add User")
//                            .font(.system(size:50))
//                            .font(.title)
//                        Text("Presentation:")
//                            .font(.system(size:40))
//                            .foregroundColor(.black)
//
//
//                        TextEdit()
//                            .shadow(radius: 5 )
//                            .padding(.vertical,20)
//                            .padding(.horizontal,10)
//                     Text("Percipitance:")
//                        .font(.system(size:40))
//                        .foregroundColor(.black)
//                            CheckboxView2()
//                    }
//
//
//                VStack(alignment: .leading, spacing: 8){
//
//                    Text("Pattern:")
//                        .font(.system(size:40))
//                        .foregroundColor(.black)
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
//                    TheperiodoftheproblemView()
//
//                        }
//                    VStack(alignment: .leading, spacing: 8){
//
//
//                    }//:VStack
//
//              }//:LAZYVGRID
//              .ignoresSafeArea(.all, edges: .top)
//            }//:SCROLL
//          } //: GROUP
////          .navigationBarTitle("PreActivity", displayMode:.large)
//            }//:ZSatck
//        } //: NAVIGATION
//        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct PreActivity2_Previews: PreviewProvider {
    static var previews: some View {
        PreActivity2()
    }
}
