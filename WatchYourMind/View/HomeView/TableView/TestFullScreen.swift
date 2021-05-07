//
//  TestFullScreen.swift
//  WatchYourMind
//
//  Created by Gatang on 6/5/2564 BE.
//

import SwiftUI

struct TestFullScreen: View {
    @State var showModal = false

        var body: some View {
            Button(action: { showModal = true }) {
                Text("My Button")
            }
            .fullScreenCover(isPresented: $showModal) {
                ModalView()
            }
        }
}


struct TestFullScreen_Previews: PreviewProvider {
    static var previews: some View {
        TestFullScreen()
    }
}

struct ModalView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Text("Close Modal")
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
    }
}
