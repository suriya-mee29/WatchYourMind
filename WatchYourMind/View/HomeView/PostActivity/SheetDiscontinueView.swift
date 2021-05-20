//
//  Discontinue.swift
//  WatchYourMind
//
//  Created by Gatang on 18/3/2564 BE.
//

import SwiftUI




struct DiscontinueView: View {
    @State var showSheetView = false
//    let feedback = UIImpactFeedbackGenerator(style: .heavy)
//    @EnvironmentObject var somethingAnaly: somethingAnalysis
    
var body: some View {

    VStack{

        
        ScrollView(.vertical, showsIndicators: true) {
//        DefineAfterView(iSSave: .constant(false))
        

//           Button(action: {
//               self.showSheetView.toggle()
//           }) {
//            HStack{
//                Text("Scroll up to see PreActivity")
//                    .font(.system(size: 30))
//                    .foregroundColor(.black)
//            VStack(spacing:-8){
//
//            Text("\(Image.init(systemName: "chevron.compact.up"))")
//                .font(.system(size: 30))
//                .foregroundColor(.purple)
//
//            Text("\(Image.init(systemName: "chevron.compact.up"))")
//                .font(.system(size: 30))
//                .foregroundColor(.purple)
//            }
//
//           }//:HSTACK
//           }//:BUTTON
          
//           .sheet(isPresented: $showSheetView) {
//               SheetView(showSheetView: self.$showSheetView)
//                .background(Color(.secondarySystemBackground))
//                .cornerRadius(16)
//           }//:SHEET
//           .padding(.top,20)
            

            
        }//:SchollView
//        .ignoresSafeArea(.all)
//    }else{
//        SomethingAnalysisView()
//    }
       }//:VSTACK
    
    }
            
}

struct SheetView: View {
    @Binding var showSheetView: Bool

    var body: some View {

        PreActivity2()
            .navigationBarTitle(Text("PreActivity"), displayMode: .inline)

    }
}
        

struct DiscontinueView_Previews: PreviewProvider {
    static var previews: some View {
        DiscontinueView()
    }
}
//
