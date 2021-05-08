//
//  SheetTableView.swift
//  WatchYourMind
//
//  Created by Gatang on 14/4/2564 BE.
//

import SwiftUI

struct SheetTableView: View {
    @State var showSheetView = false
    let animals: [User] = Bundle.main.decode("users.json")
    var body: some View {
        
//        VStack {
//            NavigationView{
                List{
                ScrollView{
          
                ForEach(animals) { animall in
                    HStack{
                        AnimalListItemView(animal: animall, create: Date())
                        
                        Button(action: {
                            self.showSheetView.toggle()
                        }) {
                            Text("\(Image.init(systemName: "chevron.forward"))")
                                .fontWeight(.bold)
                         
                        }
                    }

                } //: LOOP
                    
            }
                }
            .sheet(isPresented: $showSheetView) {
                AnimalListItemSheetView2(showSheetView: self.$showSheetView)
            }
    }
}

struct AnimalListItemSheetView2: View {
    @Binding var showSheetView: Bool

    var body: some View {

                PreActivity()
            .navigationBarTitle(Text("PreActivity"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    print("Dismissing sheet view...")
                    self.showSheetView = false
                }) {
                    Text("Done").bold()
                })
//        }
    }
}

struct SheetTableView_Previews: PreviewProvider {
    static var previews: some View {
        SheetTableView()
    }
}
