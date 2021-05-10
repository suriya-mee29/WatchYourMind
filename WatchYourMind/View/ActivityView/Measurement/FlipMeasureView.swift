//
//  TestView.swift
//  WatchYourMind
//
//  Created by Gatang on 17/3/2564 BE.
//

import SwiftUI
//
//let columnSpacing: CGFloat = 2
//let rowSpacing: CGFloat = 2
//var gridLayout: [GridItem] {
//  return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 6)
//}

struct FlipMeasureView: View {
    @State var flippedCard: Int?
       @State var frontCard: Int?
       let cards = [1,2,3,4,5,6,7,8,9,10]
    let gridLayoutIphone: [GridItem] = Array(repeating: .init(.flexible()), count: 5)
    let gridLayoutNonIphone: [GridItem] = Array(repeating: .init(.flexible()), count: 5)
    @State var isIphone: Bool = true
       var body: some View {
        VStack{
        if isIphone{
          GeometryReader { screenGeometry in
             ZStack {
                ScrollView(.vertical, showsIndicators: false, content: {
                LazyVGrid(columns: gridLayoutIphone, spacing: 0, content: {
                      ForEach(cards, id: \.self) { card in
                         let isFaceUp = flippedCard == card
                         GeometryReader { cardGeometry in
                            ZStack {
                               CardBackView(card: card)
                                  .modifier(FlipOpacity(pct: isFaceUp ? 0 : 1))
                                  .rotation3DEffect(Angle.degrees(isFaceUp ? 180 : 360), axis: (0,1,0))
                                  .frame(width: cardGeometry.size.width, height: cardGeometry.size.height)
                                .scaleEffect(isFaceUp ? screenGeometry.size.width / cardGeometry.size.width: 0.75)
//                                .padding()
                               CardFrontView(card: card)
                                  .modifier(FlipOpacity(pct: isFaceUp ? 1 : 0))
                                  .rotation3DEffect(Angle.degrees(isFaceUp ? 0 : 180), axis: (0,1,0))
                                  .frame(width: screenGeometry.size.width, height: screenGeometry.size.height)
                                .scaleEffect(isFaceUp ? 0.75 : cardGeometry.size.width / screenGeometry.size.width)
//                                .padding()
                            }

                            .offset(x: isFaceUp ? -cardGeometry.frame(in: .named("mainFrame")).origin.x: -screenGeometry.size.width/2 + cardGeometry.size.width/2,
                                    y: isFaceUp ? -cardGeometry.frame(in: .named("mainFrame")).origin.y: -screenGeometry.size.height/2 + cardGeometry.size.height/2)
                            .onTapGesture {
                               withAnimation(.linear(duration: 1.0)) {
                                  if flippedCard == nil {
                                     flippedCard = card
                                     frontCard = card
                                  } else if flippedCard == card {
                                     flippedCard = nil
                                  }//:else
                               }//:withAnimation
                            }//:onTapGesture
                         }//:GeometryReader
                         .aspectRatio(0.75, contentMode: .fit)
                         .zIndex(frontCard == card ? 1 : 0)
                         
                      }
                   })
                 

                })
             }
             
          }//:GeometryReader
          .coordinateSpace(name: "mainFrame")
        }//:IF
        else{
            GeometryReader { screenGeometry in
               ZStack {
                  ScrollView(.vertical, showsIndicators: false, content: {
                  LazyVGrid(columns: gridLayoutNonIphone, spacing: 0, content: {
                        ForEach(cards, id: \.self) { card in
                           let isFaceUp = flippedCard == card
                           GeometryReader { cardGeometry in
                              ZStack {
                                 CardBackView(card: card)
                                    .modifier(FlipOpacity(pct: isFaceUp ? 0 : 1))
                                    .rotation3DEffect(Angle.degrees(isFaceUp ? 180 : 360), axis: (0,1,0))
                                    .frame(width: cardGeometry.size.width, height: cardGeometry.size.height)
                                  .scaleEffect(isFaceUp ? screenGeometry.size.width / cardGeometry.size.width: 0.75)
  //                                .padding()
                                 CardFrontView(card: card)
                                    .modifier(FlipOpacity(pct: isFaceUp ? 1 : 0))
                                    .rotation3DEffect(Angle.degrees(isFaceUp ? 0 : 180), axis: (0,1,0))
                                    .frame(width: screenGeometry.size.width, height: screenGeometry.size.height)
                                    .scaleEffect(isFaceUp ? 1.55 : cardGeometry.size.width / screenGeometry.size.width)
                              }

                              .offset(x: isFaceUp ? -cardGeometry.frame(in: .named("mainFrame")).origin.x: -screenGeometry.size.width/2 + cardGeometry.size.width/2,
                                      y: isFaceUp ? -cardGeometry.frame(in: .named("mainFrame")).origin.y: -screenGeometry.size.height/2 + cardGeometry.size.height/2)
                              .onTapGesture {
                                 withAnimation(.linear(duration: 1.0)) {
                                    if flippedCard == nil {
                                       flippedCard = card
                                       frontCard = card
                                    } else if flippedCard == card {
                                       flippedCard = nil
                                    }//:else
                                 }//:withAnimation
                              }//:onTapGesture
                           }//:GeometryReader
                           .aspectRatio(0.75, contentMode: .fit)
                           .zIndex(frontCard == card ? 1 : 0)
                           
                        }
                     })
                   

                  })
               }
               
            }//:GeometryReader
            .coordinateSpace(name: "mainFrame")

        }
       } //:VStack
            .onAppear(perform: {
                if UIDevice.current.userInterfaceIdiom == .phone{
                   isIphone = true
                }else{
                    isIphone = false
                }
            })//:onAppear
}
    }

    struct FlipOpacity: AnimatableModifier {
       var pct: CGFloat = 0
       
       var animatableData: CGFloat {
          get { pct }
          set { pct = newValue }
       }
       
       func body(content: Content) -> some View {
          return content.opacity(Double(pct.rounded()))
       }
    }

    struct CardBackView: View {
       var card: Int
       
       var body: some View {
          ZStack {
//             RoundedRectangle(cornerRadius: 10)
//                .fill(Color.red)
//                .padding(5)
//             Text("Back \(card)")
            MeasureFront(activityName: "Music Relaxation", Description: "35",  colorActivity: "incompleteColor")
          }
       }
    }

    struct CardFrontView: View {
       var card: Int
       
       var body: some View {
          ZStack {
//             RoundedRectangle(cornerRadius: 10)
//                .fill(Color.blue)
//                .padding(10)
//                .aspectRatio(1.0, contentMode: .fit)
//             Text("Front \(card)")
            MeasureBack()
           
            
          }
       }
    }

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        FlipMeasureView()
    }
}

