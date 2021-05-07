//
//  TableListUser2.swift
//  WatchYourMind
//
//  Created by Gatang on 16/4/2564 BE.
//

import SwiftUI

struct TableListUser2: View {
    let animals: [Animal] = Bundle.main.decode("animals.json")
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
                 
                }
            }
                .fullScreenCover(isPresented:$showSheetView){
                    AnalysisSheetView(showSheetView: self.$showSheetView)
                    CloseFullView()
                
//                .sheet(isPresented: $showSheetView) {
//                AnalysisSheetView(showSheetView: self.$showSheetView)
            }
          
        }//:VSTACK
    }
}
struct AnalysisSheetView: View {
@Binding var showSheetView: Bool

var body: some View {
    NavigationView {
//            Text("Sheet View content")
        AnalysisView()
        .navigationBarTitle(Text("Post Activity"), displayMode: .large)
    }.navigationViewStyle(StackNavigationViewStyle())
//            .navigationTitle("PreActicity")
        
//                .navigationBarItems(trailing: Button(action: {
//                    print("Dismissing sheet view...")
//                    self.showSheetView = false
//                }) {
//                    Text("Done").bold()
//                })

}
}

struct TableListUser2_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
    
        TableListUser2()
//            .previewDevice("iPhone 12 Pro")
          .previewLayout(.sizeThatFits)
    }
}


struct CloseFullView2: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        HStack{
        Text("Close")
        Image(systemName: "multiply")
        }
            .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(40)
            
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
    }
}
