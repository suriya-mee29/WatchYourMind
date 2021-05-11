//
//  textFieldautoSize.swift
//  WatchYourMind
//
//  Created by Gatang on 11/5/2564 BE.
//

import SwiftUI

struct textFieldautoSize: View {
    @State var text = ""

           var body: some View {
            VStack {
//                Text("text is: \(text)")
                TextView(
                    text: $text
                )
                    .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 100)
            }

           }
    }

struct textFieldautoSize_Previews: PreviewProvider {
    static var previews: some View {
        textFieldautoSize()
    }
}

struct TextView: UIViewRepresentable {
    @Binding var text: String

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextView {

        let myTextView = UITextView()
        myTextView.delegate = context.coordinator

        myTextView.font = UIFont(name: "HelveticaNeue", size: 15)
        myTextView.isScrollEnabled = true
        myTextView.isEditable = true
        myTextView.isUserInteractionEnabled = true
        myTextView.backgroundColor = UIColor(white: 0.0, alpha: 0.05)

        return myTextView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }

    class Coordinator : NSObject, UITextViewDelegate {

        var parent: TextView

        init(_ uiTextView: TextView) {
            self.parent = uiTextView
        }

        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }

        func textViewDidChange(_ textView: UITextView) {
            print("text now: \(String(describing: textView.text!))")
            self.parent.text = textView.text
        }
    }
}
