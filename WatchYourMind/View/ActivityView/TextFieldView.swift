//
//  DefineClient.swift
//  WatchYourMind
//
//  Created by Gatang on 1/3/2564 BE.
//

import SwiftUI

struct TextFieldView: View {

    @Binding var text: String

       var body: some View {

        TextField("", text: self.$text)

            .textFieldStyle(RoundedBorderTextFieldStyle())

            .padding(.horizontal)
            .onTapGesture {
                hideKeyboard()
            }

       }
    
}
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif




struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(text: .constant(""))
    }
}
