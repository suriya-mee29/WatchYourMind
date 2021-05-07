//
//  PreActivity.swift
//  WatchYourMind
//
//  Created by Gatang on 1/3/2564 BE.
//

import SwiftUI

class ManualList: ObservableObject {
  @Published var showingPage: Bool = false
  @Published var selectedPage: ManualActivityList? //= nil
}

struct PreActivity: View {
    let colorBackground: Color = Color("bg-1")
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    
//    @State var next = "NEXT"
    
    let prefeedback = UIImpactFeedbackGenerator(style: .heavy)
    @EnvironmentObject var activitylist: ManualList
     
    var body: some View {
        ZStack{
        if activitylist.showingPage == false  {
            VStack{
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


                    TextEdit()
                            .shadow(radius: 5 )
                            .padding(.vertical,20)
                            .padding(.horizontal,10)
                     Text("Percipitance:")
                        .font(.system(size:40))
                        .foregroundColor(.black)
                            CheckboxView2()
                    }


                VStack(alignment: .leading, spacing: 8){

                    Text("Pattern:")
                        .font(.system(size:40))
                        .foregroundColor(.black)


                    TextEdit()
                        .shadow(radius: 5 )
                        .padding(.vertical,20)
                        .padding(.horizontal,10)
                    }
                VStack(alignment: .leading, spacing: 8){
                Text("Faulty Thinking")
                    .font(.system(size:30))//                .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(.leading)
                TextEdit()
                    .shadow(radius: 5 )
                    .padding(.horizontal,10)
                }
                VStack(alignment: .leading, spacing: 8){
                    Text("Intensity Level: ")
                        .font(.system(size:40))
                        .foregroundColor(.gray)
                    IntensityLevelView()
                    }
                        VStack(alignment: .center,spacing: 30) {
                    EmotionView()
                        }.padding(.vertical,8)

                VStack(alignment: .leading, spacing: 0){
                            Text("Effect")
                                .font(.system(size:40))
                                .foregroundColor(.gray)
                    Effects()
                    TheperiodoftheproblemView()

                        }
//                    VStack(alignment: .leading, spacing: 8){
//                        NavigationLink(destination:   ManualActivityList()
//) {
//                         Spacer()
//                         HStack(alignment: .bottom) {
//                             Text("NEXT")
//                                 .fontWeight(.heavy)
//                                 .foregroundColor(Color.black)
//                             Image(systemName: "chevron.forward" )
//                                 .font(.title)
//                                 .foregroundColor(.purple)
//                                 .font(.system(size: 25))
////
//
//                         }//HSTACK
//
//             .padding(.horizontal,20)
//                         .padding(10)
//                         .background(Color.white)
//                         .cornerRadius(10)
//                         .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
//                         .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
//                         .padding(.trailing,20)
//                         .padding(.vertical,10)
//
//
//                        }//:NavigationLink
//                    }//:VStack
//                HStack{
                Button(action: {
                }, label: {
                    Image(systemName: "chevron.forward")
                        .scaledToFit()
                         .fixedSize()
                         .foregroundColor(.black)
                         
                        .frame(width: 20, height: 20)
                        .padding()
                        .background(Color("bg-2"))
                        .frame(width: 40, height: 40)
                        .cornerRadius(100)
                        .onTapGesture {
                          prefeedback.impactOccurred()
                            activitylist.showingPage = true
                        }
                }) //: BUTTON-NEXT
              }//:HSTACK

              }//:LAZYVGRID
              .ignoresSafeArea(.all, edges: .top)
            }//:SCROLL
//          } //: GROUP
//          .navigationBarTitle("PreActivity", displayMode: .large)
          
//        } //: NAVIGATION
//        .navigationViewStyle(StackNavigationViewStyle())
//            }
    }//:IF
        else{
            ManualActivityList()
        }
            
        }//:ZStack
        
        
    }//:BODY
}//:struct PreActivity
    
    


struct PreActivity_Previews: PreviewProvider {
    static var previews: some View {
        PreActivity()
        .environmentObject(ManualList())
    }
}
