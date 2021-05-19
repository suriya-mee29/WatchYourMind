//
//  TestView.swift
//  WatchYourMind
//
//  Created by Gatang on 17/3/2564 BE.
//

import SwiftUI


struct FlipMeasureView: View {
     @Binding var selectedActivities : [ActivityModel]
     @State var flippedCard: Int?
     @State var flippedCardStr : String?
     @State var frontCard: Int?
       let cards = [1,2,3,4,5,6,7,8,9,10]
    let gridLayoutIphone: [GridItem] = Array(repeating: .init(.flexible()), count: 5)
    let gridLayoutNonIphone: [GridItem] = Array(repeating: .init(.flexible()), count: 5)
    @State var isIphone: Bool = true
       var body: some View {
        VStack{
        if isIphone{
//          GeometryReader { screenGeometry in
//             ZStack {
//                ScrollView(.vertical, showsIndicators: false, content: {
//                LazyVGrid(columns: gridLayoutIphone, spacing: 0, content: {
//
//                      ForEach(cards, id: \.self) { card in
//                         let isFaceUp = flippedCard == card
//                         GeometryReader { cardGeometry in
//                            ZStack {
//
//                                CardBackView(card: card)
//                                  .modifier(FlipOpacity(pct: isFaceUp ? 0 : 1))
//                                  .rotation3DEffect(Angle.degrees(isFaceUp ? 180 : 360), axis: (0,1,0))
//                                  .frame(width: cardGeometry.size.width, height: cardGeometry.size.height)
//                                .scaleEffect(isFaceUp ? screenGeometry.size.width / cardGeometry.size.width: 0.75)
////                                .padding()
//                               CardFrontView(card: card)
//                                  .modifier(FlipOpacity(pct: isFaceUp ? 1 : 0))
//                                  .rotation3DEffect(Angle.degrees(isFaceUp ? 0 : 180), axis: (0,1,0))
//                                  .frame(width: screenGeometry.size.width, height: screenGeometry.size.height)
//                                .scaleEffect(isFaceUp ? 0.75 : cardGeometry.size.width / screenGeometry.size.width)
////                                .padding()
//                            }
//
//                            .offset(x: isFaceUp ? -cardGeometry.frame(in: .named("mainFrame")).origin.x: -screenGeometry.size.width/2 + cardGeometry.size.width/2,
//                                    y: isFaceUp ? -cardGeometry.frame(in: .named("mainFrame")).origin.y: -screenGeometry.size.height/2 + cardGeometry.size.height/2)
//                            .onTapGesture {
//                               withAnimation(.linear(duration: 1.0)) {
//                                  if flippedCard == nil {
//                                     flippedCard = card
//                                     frontCard = card
//                                  } else if flippedCard == card {
//                                     flippedCard = nil
//                                  }//:else
//                               }//:withAnimation
//                            }//:onTapGesture
//                         }//:GeometryReader
//                         .aspectRatio(0.75, contentMode: .fit)
//                         .zIndex(frontCard == card ? 1 : 0)
//
//                      }
//
//                   })
//
//
//                })
//             }
//
//          }//:GeometryReader
//          .coordinateSpace(name: "mainFrame")
        }//:IF
        else{
            GeometryReader { screenGeometry in
               ZStack {
                  ScrollView(.vertical, showsIndicators: false, content: {
                  LazyVGrid(columns: gridLayoutNonIphone, spacing: 0, content: {
                    ForEach(self.selectedActivities) { card in
                        let isFaceUp = flippedCardStr == card.id.uuidString
                           GeometryReader { cardGeometry in
                              ZStack {
                                 CardBackView(activity: card)
                                    .modifier(FlipOpacity(pct: isFaceUp ? 0 : 1))
                                    .rotation3DEffect(Angle.degrees(isFaceUp ? 180 : 360), axis: (0,1,0))
                                    .frame(width: cardGeometry.size.width, height: cardGeometry.size.height)
                                  .scaleEffect(isFaceUp ? screenGeometry.size.width / cardGeometry.size.width: 0.75)
  //                                .padding()
                                CardFrontView(activity: self.$selectedActivities , selectedAnActivity: card)
                                    .modifier(FlipOpacity(pct: isFaceUp ? 1 : 0))
                                    .rotation3DEffect(Angle.degrees(isFaceUp ? 0 : 180), axis: (0,1,0))
                                    .frame(width: screenGeometry.size.width, height: screenGeometry.size.height)
                                    .scaleEffect(isFaceUp ? 1.55 : cardGeometry.size.width / screenGeometry.size.width)
                              }

                              .offset(x: isFaceUp ? -cardGeometry.frame(in: .named("mainFrame")).origin.x: -screenGeometry.size.width/2 + cardGeometry.size.width/2,
                                      y: isFaceUp ? -cardGeometry.frame(in: .named("mainFrame")).origin.y: -screenGeometry.size.height/2 + cardGeometry.size.height/2)
                              .onTapGesture {
                                 withAnimation(.linear(duration: 1.0)) {
                                    if flippedCardStr == nil {
                                        flippedCardStr = card.id.uuidString
                                    } else if flippedCardStr == card.id.uuidString {
                                        print("rages: \(card.indicator)")
                                        print("isEvery: \(card.everyDay)")
                                        print("time: \(card.time)")
                                        print("round: \(card.round)")
                                        print("NoOfDays: \(card.NoOfDate ?? -1)")
                                       flippedCardStr = nil
                                    }//:else
                                 }//:withAnimation
                              }//:onTapGesture
                           }//:GeometryReader
                           .aspectRatio(0.75, contentMode: .fit)
                           .zIndex(flippedCardStr == card.id.uuidString ? 1 : 0)
                           
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
     
        let activity : ActivityModel
       
       var body: some View {
          ZStack {

            MeasureFront( activity: activity , colorActivity: "incompleteColor")
          }
       }
    }

    struct CardFrontView: View {
       @Binding var activity : [ActivityModel]
        let selectedAnActivity : ActivityModel
       
       var body: some View {
          ZStack {

            MeasureBack(activity: self.$activity, seletedAnActivity: selectedAnActivity)
           
            
          }
       }
    }

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        FlipMeasureView(selectedActivities: .constant([ActivityModel(createdby: "koi", description: "hello hello", imageIcon: "gamer", title: "Music Relexation1", type: "MANUAL", createdDate: Date(), dockey: "key"),ActivityModel(createdby: "koi", description: "hello hello", imageIcon: "gamer", title: "Music Relexation2", type: "MANUAL", createdDate: Date(), dockey: "key"),ActivityModel(createdby: "koi", description: "hello hello", imageIcon: "gamer", title: "Music Relexation3", type: "MANUAL", createdDate: Date(), dockey: "key")]))
    }
}

