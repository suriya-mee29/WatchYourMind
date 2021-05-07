//
//  SheetNewActivity.swift
//  WatchYourMind
//
//  Created by Gatang on 31/3/2564 BE.
//

import SwiftUI

struct SheetNewActivity: View {
    @Binding var showSheetView: Bool

       var body: some View {
           NavigationView {
               Text("List of notifications")
               .navigationBarTitle(Text("Notifications"), displayMode: .inline)
                   .navigationBarItems(trailing: Button(action: {
                       print("Dismissing sheet view...")
                       self.showSheetView = false
                   }) {
                       Text("Done").bold()
                   })
           }
       }
}


