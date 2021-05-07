//
//  SwiftUIView.swift
//  WatchYourMind
//
//  Created by Gatang on 9/3/2564 BE.
//

import SwiftUI

extension UIApplication {
    func endEditing2(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        modifier(ResignKeyboardOnDragGesture())
    }
}


struct SearchModel: View {
    
    @Binding var searchText: String
    @State private var showCancelButton: Bool = false
    var onCommit: () ->Void = {print("onCommit")}
    
    var body: some View {
        HStack {
            ZStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    
                    // Search text field
                    ZStack (alignment: .leading) {
                        if searchText.isEmpty{ // Separate text for placeholder to give it the proper color
                            Text("Search username or userID")
                            
                                .font(.system(size: 15))
                                
                            
                            
                            
                        }
                        TextField("", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        }, onCommit: onCommit).foregroundColor(.black)
                    }
                    // Clear button
                    Button(action: {
//                        self.searchText = ""
                        UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                        self.searchText = ""
                        self.showCancelButton = false
                    }) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }
                    
                   
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary) // For magnifying glass and placeholder test
                .background(Color(.tertiarySystemFill))
                .cornerRadius(10.0)
                
//
//                Image(systemName: "moon")
            }
            
//            if showCancelButton  {
//                // Cancel button
//                Button("Cancel") {
//                    UIApplication.shared.endEditing(true) // this must be placed before the other commands here
//                    self.searchText = ""
//                    self.showCancelButton = false
//                }
//                .foregroundColor(Color(.systemBlue))
//            }
            
//            Image(systemName: "moon")
//            Button(action: {}, label: {
//            Image(systemName: "bell")
//              .font(.title)
//              .foregroundColor(.black)
//
//            
//            Circle()
//              .fill(Color.red)
//              .frame(width: 14, height: 14, alignment: .center)
//              .offset(x: -25, y: -10)
//                
//           
//            }) //: BUTTON-BELL
//            
//            Button(action: {}, label: {
//        
//                Image("Avatar_purple")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 50, height: 50)
//    //                .padding(.leading,20)
//    //                .padding(.trailing,20)
//            }) //: BUTTON-AVATAR
            
        }
//        .padding(.vertical)
//        .padding(.horizontal)
        .navigationBarHidden(showCancelButton)
    }
}

