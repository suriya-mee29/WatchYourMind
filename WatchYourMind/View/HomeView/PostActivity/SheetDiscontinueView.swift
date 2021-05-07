//
//  Discontinue.swift
//  WatchYourMind
//
//  Created by Gatang on 18/3/2564 BE.
//

import SwiftUI

struct DiscontinueView: View {
    @State var showSheetView = false
    
var body: some View {
//    NavigationView {
        ZStack {
    VStack{
        ScrollView(.vertical, showsIndicators: true) {
//            PostActivityNavigationbar()
        DefineAfterView(iSSave: .constant(false))
            HStack{
            NavigationLink(destination: SomethingAnalysisView()) {
             Spacer()
//             HStack(alignment: .bottom) {

                 Image(systemName: "chevron.forward" )
                     .font(.title)
                     .foregroundColor(.purple)
                     .font(.system(size: 25))
                
//


//             }//HSTACK

 .padding(.horizontal,20)
             .padding(10)
             .background(Color.white)
             .clipShape(Circle())
             .cornerRadius(10)
             .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
             .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
             .padding(.trailing,20)
             .padding(.vertical,10)
             
                            
            }//:NavigationLink
                
        }//:HSTACK
           Button(action: {
               self.showSheetView.toggle()
           }) {
            HStack{
                Text("Scroll up to see PreActivity")
                    .font(.system(size: 30))
                    .foregroundColor(.black)
            VStack(spacing:-8){
                
            Text("\(Image.init(systemName: "chevron.compact.up"))")
                .font(.system(size: 30))
                .foregroundColor(.purple)

            Text("\(Image.init(systemName: "chevron.compact.up"))")
                .font(.system(size: 30))
                .foregroundColor(.purple)
            }
            
           }
           }
          
           .sheet(isPresented: $showSheetView) {
               SheetView(showSheetView: self.$showSheetView)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(16)
           }//:SHEET
        }//:SchollView
       }//:VSTACK
        }//:NavigationView
    
    }
            
}

struct SheetView: View {
    @Binding var showSheetView: Bool

    var body: some View {

        PreActivity2()
            .navigationBarTitle(Text("PreActivity"), displayMode: .inline)
//                    .font(.system(size: 40))
//                .navigationBarItems(trailing: Button(action: {
//                    print("Dismissing sheet view...")
//                    self.showSheetView = false
//                }) {
//                    Text("Done").bold()
//                })
//        }
    }
}
        

struct DiscontinueView_Previews: PreviewProvider {
    static var previews: some View {
        DiscontinueView()
    }
}
//
