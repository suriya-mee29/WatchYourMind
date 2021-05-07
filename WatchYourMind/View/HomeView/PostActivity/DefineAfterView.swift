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
//    init() {
//           UITextView.appearance().backgroundColor = .clear
//       }
   

    var body: some View {
//        ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center) {
            
            Text("Faulty Thinking")
                .font(.system(size:30))//                .fontWeight(.semibold)
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
            
            Text("New Faulty Thinking")
                .font(.system(size:30))
//                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(.leading)
                .padding(.top,30)
            TextEditor(text: $newfullText)
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
                .padding(.bottom,30)
            
            IntensityLevelView()
                .padding(.bottom,30)
                .padding(.horizontal,10)
            
            EmotionView()
                .padding(.bottom,30)
                .padding(.horizontal,10)
            
            Text("Summary of Activity")
                .font(.system(size:30))
                .foregroundColor(.black)
                .padding(.top,30)
            
          RatingView()
            .padding(.bottom,50)
            Button(action: {
//                var strArr : [String] = []
//                if selectedItems.count > 0 {
//                for i in 0...(selectedItems.count - 1) {
//                    strArr.append(self.selectedItems[1].name)
//                }
//                }
                
//                let data = ManualActivityModel(id: UUID().uuidString, createby: "admin", title: text, description: fullText, createDate: Date(), type: "MANUAL", imageicon: "", link: "", pic: "", outcome: strArr)
//                self.activityData = data
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

            
        }//:VSTACK
        
//        .navigationBarTitle("Post Activity".uppercased())
//        }//:SCROLLVIEW
        .ignoresSafeArea(.all, edges: .bottom)
        
    }
}

struct DefineAfterView_Previews: PreviewProvider {
    static var previews: some View {
        DefineAfterView(iSSave: .constant(false))
    }
}
