//
//  TextEditor.swift
//  WatchYourMind
//
//  Created by Gatang on 5/3/2564 BE.
//

import SwiftUI

struct TextEdit: View {
    
    @State private var fullText: String = ""
    init() {
           UITextView.appearance().backgroundColor = .clear
       }
    
    var body: some View {
       
        TextEditor(text: $fullText)
            .font(.title)
                .autocapitalization(.words)
                .disableAutocorrection(true)
            
            
            .frame(height: 200)
            .cornerRadius(3)
            .background(Color.white)

            .onTapGesture {
                hideKeyboard()
            }
        
    }
}

//#if canImport(UIKit)
//extension View {
//    func hideKeyboard() {
//        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//    }
//}
//#endif

struct TextEdit_Previews: PreviewProvider {
    static var previews: some View {
        TextEdit().previewLayout(.sizeThatFits)
    }
}
