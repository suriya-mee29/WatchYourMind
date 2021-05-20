//
//  NavigationDiscontinueView.swift
//  WatchYourMind
//
//  Created by Gatang on 19/5/2564 BE.
//

import SwiftUI

struct NavigationSomethingAnaly: View {
    var body: some View {
        HStack{
            ZStack {
               
            Button(action: {
            }, label: {
                Image(systemName: "magnifyingglass")
                    .scaledToFit()
                    
    
                     .fixedSize()
                    .font(.system(size: 25))
                     .foregroundColor(.black)
                     
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(Color.white)
                    .frame(width: 40, height: 40)
                    .cornerRadius(100)
//                    .onTapGesture {
//                      feedback.impactOccurred()
//
//                        shop.showingProduct = true
////                                  }
//                    }
            }) //: BUTTON-SEARCH
                

            }//:ZSTACK

            .padding(.leading)
            Spacer()

          
            HStack{
                Image("WatchMyMindNoBG")
                    

                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding()
                    .frame(width: 40, height: 40)
                    .background(Color.white)
                    .cornerRadius(8)

//                    .onAppear(perform: {
//                      withAnimation(.easeOut(duration: 0.5)) {
//                        isAnimated.toggle()
//                      }
//                    })

//                    }
            Text("watch my mind".uppercased())
                .font(.system(size: 20, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(Color.white)

            }

            Spacer()

                
            ZStack {
                
               
            Button(action: {
            }, label: {
//                            Image(systemName: "person.badge.plus")
                Image(systemName: "bell")
                    .font(.system(size: 26))
                    .scaledToFit()
                     .fixedSize()
                     .foregroundColor(.black)
                     
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(Color.white)
                    .frame(width: 40, height: 40)
                    .cornerRadius(100)
//                    .onTapGesture {
//                      feedbackbell.impactOccurred()
//                    clientRequest.showingProduct = true
//                    }
            }) //: BUTTON-BELL
            
                .frame(width: 20, height: 20)
            }//:ZSTACK
            .padding(.trailing,10)
//                    Spacer()
            
            .frame( height: 80)
            
          
            .padding(.trailing,50)
//                    Spacer()
            
            .frame( height: 80)
            
        }//:HSTACK
        .background(Color.purple)
        .edgesIgnoringSafeArea(.all)


    }
}

struct NavigationDiscontinueView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSomethingAnaly()
    }
}
