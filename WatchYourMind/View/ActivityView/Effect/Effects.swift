//
//  Effects.swift
//  WatchYourMind
//
//  Created by Gatang on 2/3/2564 BE.
//

import SwiftUI

struct ChecklistItem: Identifiable {
  let id = UUID()
  var name: String
  var isChecked: Bool = false
}


struct Effects: View {
    @State var checklistItems = [
      ChecklistItem(name: "Hour(s) of sleep / day"),
      ChecklistItem(name: "Exercise is reduced / week ")
    
    ]

    var body: some View {
            VStack(alignment: .leading) {
                
                            ForEach(checklistItems) { checklistItem in
                              HStack {
                                Text(checklistItem.isChecked ? Image(systemName: "checkmark.square.fill"):  Image(systemName: "square.fill"))
                                    .font(.system(size: 25))
                                Text(checklistItem.name)
                                    .font(.system(size:21))

//                                Spacer()
                                TextFieldView()
                                    .shadow(radius: 3 )
                                    .textContentType(.oneTimeCode)
                                       .keyboardType(.numberPad)
                                    .frame(width:90, height: 50)
//                                    .fixedSize()
                                Spacer()

                              }
                                     .onTapGesture {
                                       if let matchingIndex =
                                         self.checklistItems.firstIndex(where: { $0.id == checklistItem.id }) {
                                         self.checklistItems[matchingIndex].isChecked.toggle()
                                       }
                                     }//: onTapGesture

                            }
                    EffectsActive()
                        .padding(.vertical,20)
        

        }//:VSTACK


//        }//:VSTACK
      }
    }


func checkboxSelected(id: String, isMarked: Bool) {
    print("\(id) is marked: \(isMarked)")
}


struct Effects_Previews: PreviewProvider {
    static var previews: some View {
        Effects()
    }
}
