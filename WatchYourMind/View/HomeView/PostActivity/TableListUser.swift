//
//  PresentationView.swift
//  WatchYourMind
//
//  Created by Gatang on 18/3/2564 BE.
//

import SwiftUI

//class SomethingAnaly: ObservableObject {
//  @Published var showingPage: Bool = false
//  @Published var selectedPage: SomethingAnalysisView? //= nil
//}

struct TableListUser: View {
    
    let animals : [User]
    @State var showSheetView = false
//    let feedback = UIImpactFeedbackGenerator(style: .heavy)
//    @EnvironmentObject var somethingAnaly: SomethingAnaly
    var body: some View {
//        ZStack{
//            if somethingAnaly.showingPage == false {
//        VStack(alignment: .leading,spacing: 0){
                List(animals) { trail in
                    HStack {
                    AnimalListItemView(animal: trail, create: Date())
                }
                    Spacer()
//                    ZStack{
                Button(action: {
                    self.showSheetView.toggle()
                },label: {
                    Text("\(Image.init(systemName: "chevron.forward"))")
                        .fontWeight(.bold)
//                        .onTapGesture {
//                          feedback.impactOccurred()
//
//                            somethingAnaly.showingPage = true
////                                  }
//                        }
                        Spacer()
                })
                .edgesIgnoringSafeArea(.all)
                }
                .fullScreenCover(isPresented:$showSheetView){
                    AnimalListItemSheetView(showSheetView: self.$showSheetView)
                    CloseFullView()
                        .padding([.top,.trailing])
                }
//        }//:ZSTACK

//        }//:VSTACK
//            }else{
//                SomethingAnalysisView()
//            }

        
    }
}

struct AnimalListItemSheetView: View {
    @Binding var showSheetView: Bool
    
    var body: some View {
        SomethingAnalysisView()
    }
}

struct CloseFullView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        HStack{
//        Text("Close")
        Image(systemName: "multiply")
        }
            .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(100)
            
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
    }
}



struct TableListUser_Previews: PreviewProvider {
    static let animals: [User] = Bundle.main.decode("animals.json")
    static var previews: some View {
        TableListUser(animals: animals)
          .previewLayout(.sizeThatFits)
    }
}
