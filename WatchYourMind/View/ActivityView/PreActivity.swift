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
    
    
    let prefeedback = UIImpactFeedbackGenerator(style: .heavy)
    @EnvironmentObject var activitylist: ManualList
    
    @EnvironmentObject var preactivity: Preact
     
    
    var body: some View {
        ZStack{
            if activitylist.showingPage == false
            {
            VStack{
                ScrollView(.vertical, showsIndicators: false) {
                    NavigationPreActivity()
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
                     Text("Percipitance:")
                        .font(.system(size:40))
                        .foregroundColor(.black)
//                        .padding(.bottom,20)
                }
//                .padding(.bottom,30)
                .padding(.leading)
                HStack(alignment:.center){
                CheckboxView2()
                }
                .padding(.horizontal,100)
                


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
                        VStack(alignment: .leading,spacing: 30) {
                    EmotionView()
                        }.padding()

                VStack(alignment: .leading, spacing: 0){
                            Text("Effect")
                                .font(.system(size:40))
                                .foregroundColor(.black)
                                .padding(.bottom,30)
                    Effects()
                    TheperiodoftheproblemView()

                        }
                HStack{
                    Spacer()
                Button(action: {
                }, label: {
                    Image(systemName: "chevron.forward")
                        .font(.system(size:30 ))
                         .foregroundColor(.black)
                         
                        .frame(width: 90, height: 50)
                        .padding()
                      .background(Color("bg-2"))
//                        .frame(width: 60, height: 60)
                        .cornerRadius(10)
                        .onTapGesture {
                          prefeedback.impactOccurred()
                            activitylist.showingPage = true
                        }
                }) //: BUTTON-NEXT
                }
                .padding(.trailing,20)
              }//:LAZYVGRID

              }//SCROLL
              .ignoresSafeArea(.all, edges: .top)
            }//:VSTACK
    }//:IF
            
        else{
            ManualActivityList()
        }
            
            
        
        }//:ZStack
        
        
    }//:BODY
}//:struct PreActivity
    
    


struct PreActivity_Previews: PreviewProvider {
    static var previews: some View {
        PreActivity().previewLayout(.fixed(width: 1000, height: 2000))
        .environmentObject(ManualList())
    }
}
