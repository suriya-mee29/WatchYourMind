//
//  Demo2View.swift
//  WatchYourMind
//
//  Created by Gatang on 16/3/2564 BE.
//

import SwiftUI

struct Demo2View: View {
    @Binding var text : String
    var body: some View {
        ZStack {
            ZStack {
                    
                     VStack(alignment: .leading) {
                         Text("attech a link to create your activity").font(.title2)
                         HStack {
                             Image(systemName: "link")
                                .foregroundColor(.accentColor)
                             TextField("Search", text: $text)
                         }.underlineTextField2()
                         
                     }.padding()
                 }
        }
    }
}

struct Demo2View_Previews: PreviewProvider {
    static var previews: some View {
        Demo2View(text: .constant(""))
    }
}
