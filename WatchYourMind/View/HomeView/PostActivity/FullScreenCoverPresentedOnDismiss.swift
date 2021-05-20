//
//  FullScreenCoverPresentedOnDismiss.swift
//  WatchYourMind
//
//  Created by Gatang on 20/5/2564 BE.
//

import SwiftUI
import Combine
struct FullScreenCoverPresentedOnDismiss: View {
    @State private var showModal = false
      @State private var showCamera = false
      var body: some View {
//          NavigationView {
              Text("Hello World")
                  .navigationBarTitle("", displayMode: .inline)
                  .navigationBarItems(
                      leading:
                          NavigationLink(
                              destination: ModallView(message: "Dismiss Push Test"),
                              label: {Text("Push Page")}),
                      trailing:
                      Button("Show modal") {
                          self.showModal = true
                      }.sheet(isPresented: $showModal, onDismiss: {
                      print(self.showModal)
                  }) {
                      ModallView(message: "Dismiss Modal view")
                  }
              )
//          }
      }
  }

  struct ModallView: View {
      @Environment(\.presentationMode) var presentation
      let message: String

      var body: some View {
          NavigationView {
              Button(message) {
                self.presentation.wrappedValue.dismiss()
              }
              .navigationBarItems(trailing: Button("Done") {
                self.presentation.wrappedValue.dismiss()
              })
          }
      }
  }


struct FullScreenCoverPresentedOnDismiss_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenCoverPresentedOnDismiss()
    }
}
