//
//  PresentationView.swift
//  WatchYourMind
//
//  Created by Gatang on 18/3/2564 BE.
//

import SwiftUI

struct TableListUser: View {
    
    let animals : [User]
    @State var showSheetView = false
    var body: some View {
                List(animals) { trail in
                    HStack {
                    AnimalListItemView(animal: trail, create: Date())
                }
                    Spacer()
                Button(action: {
                    self.showSheetView.toggle()
                },label: {
                    Text("\(Image.init(systemName: "chevron.forward"))")
                        .fontWeight(.bold)
                        Spacer()
                })
                .edgesIgnoringSafeArea(.all)
                }
                .fullScreenCover(isPresented:$showSheetView){
                    FirstSheetView(showSheetView: self.$showSheetView)
                    CloseFullView()
                        .padding([.top,.trailing])
                }


        
    }
}

struct FirstSheetView: View {
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
