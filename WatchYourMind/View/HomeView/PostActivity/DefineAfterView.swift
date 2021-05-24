//
//  DefineAfter.swift
//  WatchYourMind
//
//  Created by Gatang on 19/3/2564 BE.
//

import SwiftUI

struct DefineAfterView: View {
    @Binding var iSSave : Bool
    @State private var fullText: String = ""
    @State private var newfullText: String = ""

    @State var showSheetView = false

    var body: some View {
        ZStack{
            VStack{
//        ScrollView(.vertical, showsIndicators: false) {
//            NavigationDefineAfter()
        VStack(alignment: .center) {
            Text("Post Activity")
                .font(.system(size: 50))
                .font(.headline)
                .fontWeight(.bold)
                .padding(.leading)
                .padding(.bottom,30)
            VStack(alignment: .center){
                VStack(alignment: .leading){
            Text("Faulty Thinking")
                .font(.system(size:40))//
                .foregroundColor(.black)
                .padding(.leading)
            TextEditor(text: $fullText)
                .font(.title)
                    .autocapitalization(.words)
                    .disableAutocorrection(true)
                
                
                .frame(height: 200)
                .cornerRadius(3)
                .background(Color.white)

                .onTapGesture {
                    hideKeyboard()
                }                .shadow(radius: 5 )
                .padding(.horizontal,10)
            
            }
                VStack(alignment: .leading){
            Text("New Faulty Thinking")
                .font(.system(size:40))
                .foregroundColor(.black)
                .padding(.leading)
                .padding(.top,70)
            TextEditor(text: $newfullText)
                                .frame(height: 250)
                                .cornerRadius(20)
                    .autocapitalization(.words)
                    .disableAutocorrection(true)
                .background(Color.white)

                .onTapGesture {
                    hideKeyboard()
                }                .shadow(radius: 5 )
                .padding(.horizontal,10)
                .padding(.bottom,30)
                }
                
                VStack(alignment: .leading){
            Text("IntensityLevel")
                .font(.system(size:40))
                .foregroundColor(.black)
                .padding(.leading)
                .padding(.top,70)
                    IntensityLevelView(sliderValue: .constant(50))                .padding(.bottom,30)
                .padding(.horizontal,10)
            
                    EmotionView(selected: .constant(""))                .padding(.bottom,30)
            Text("Summary of Activity")
                .font(.system(size:40))
                .foregroundColor(.black)
                .padding(.leading)
                .padding(.top,30)
            
          RatingView()
            .padding(.leading)
            .padding(.bottom,20)
                }
                HStack(alignment:.center){
                VStack(alignment:.center){
            Button(action: {
                self.iSSave = true
//                self.showSheetView = false
            }, label: {
                HStack {
                Image(systemName:"square.and.arrow.down")
                    .font(.system(size: 30))
                
                Text("save")
                    .font(.system(size: 30))
                }//:HSTACK
                .padding(10)
                .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                    )
            })
            .disabled(fullText.isEmpty || newfullText.isEmpty)
                
//            Button(action: {
//                self.showSheetView.toggle()
//            }) {
//             HStack{
//                 Text("Scroll up to see PreActivity")
//                     .font(.system(size: 30))
//                     .foregroundColor(.black)
//             VStack(spacing:-8){
//
//             Text("\(Image.init(systemName: "chevron.compact.up"))")
//                 .font(.system(size: 30))
//                 .foregroundColor(.purple)
//
//             Text("\(Image.init(systemName: "chevron.compact.up"))")
//                 .font(.system(size: 30))
//                 .foregroundColor(.purple)
//             }
//
//            }//:HSTACK
//            }//:BUTTON
                }
//            .sheet(isPresented: $showSheetView) {
//                SheetView(showSheetView: self.$showSheetView)
//                 .background(Color(.secondarySystemBackground))
//                 .cornerRadius(16)
//            }//:SHEET
                }
//            .padding(.top,20)
            }
        }//:VSTACK

//        }//:SCROLLVIEW
        .ignoresSafeArea(.all, edges: .top)
//        .ignoresSafeArea(.all)
            }//:VSTACK
            }//:ZSTACK
    }
}

struct DefineAfterView_Previews: PreviewProvider {
    static var previews: some View {
        DefineAfterView(iSSave: .constant(false))
    }
}
