//
//  PresentationView.swift
//  WatchYourMind
//
//  Created by Gatang on 18/3/2564 BE.
//

import SwiftUI

class PostActivity: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: DiscontinueView? //= nil
}

struct TableListUser: View {
    let animals : [User]
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
                }
                .fullScreenCover(isPresented:$showSheetView){
                    AnimalListItemSheetView(showSheetView: self.$showSheetView)
                    CloseFullView()

                }

          
        }//:VSTACK
        
    }
}
struct AnimalListItemSheetView: View {
    @Binding var showSheetView: Bool
    
    var body: some View {
        NavigationView {
//            Text("Sheet View content")
        DiscontinueView()
//            .navigationBarTitle(Text("Post Activity"), displayMode: .large)
//            .frame(width: UIScreen.Widthscreen)
        }.navigationViewStyle(StackNavigationViewStyle())
       


    }
}

struct ListDiscontinue_Previews: PreviewProvider {
    static let animals: [User] = Bundle.main.decode("animals.json")
    static var previews: some View {
        TableListUser(animals: animals)
          .previewLayout(.sizeThatFits)
    }
}


struct CloseFullView: View {
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
