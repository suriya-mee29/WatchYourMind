//
//  AnalysisTable.swift
//  WatchYourMind
//
//  Created by Gatang on 5/5/2564 BE.
//

import SwiftUI

struct AnalysisTable: View {
    let animals : [Animal]
    @State var showSheetView = false
    var body: some View {
        VStack(alignment: .leading,spacing: 0){
//            NavigationView {
           
                List(animals) { trail in
                    HStack {
                    AnimalListItemView(animal: trail, create: Date())
                      

                }
                    Spacer()
                Button(action: {
                    self.showSheetView.toggle()
                }) {
                    Text("\(Image.init(systemName: "chevron.forward"))")
                        .fontWeight(.bold)
//                        .padding(.horizontal,100)
                        Spacer()
                 
                }
            }.sheet(isPresented: $showSheetView) {
                MeasureSheetView(showSheetView: self.$showSheetView)
//                                    .frame(width:UIScreen.Widthscreen)
            }
          
        }//:VSTACK
        
    }
}
struct MeasureSheetView: View {
    @Binding var showSheetView: Bool
    
    var body: some View {
        NavigationView {
//            Text("Sheet View content")
        DiscontinueView()
            .navigationBarTitle(Text("Post Activity"), displayMode: .large)
//            .frame(width: UIScreen.Widthscreen)
        }.navigationViewStyle(StackNavigationViewStyle())
       


    }
}

struct AnalysisTable_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnalysisTable(animals: animals)
            
          .previewLayout(.sizeThatFits)
    }
}
