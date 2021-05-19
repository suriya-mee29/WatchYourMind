//
//  Effects.swift
//  WatchYourMind
//
//  Created by Gatang on 2/3/2564 BE.
//

import SwiftUI

struct Active: Identifiable {
  let id = UUID()
  var name: String
  var isChecked: Bool = false
}

enum OPTION : String{
    case hyperactive = "Hyperactive"
    case hypoactive = "Hypoactive"
    
}

struct EffectsActive: View {
    @Binding var selectedActive : String?
    
    @State var EffectsActives = [
        Active(name: "Active"),
//        Active(name: "Hypoactive" )
//        Active(name: "Hyperactive")
    
    ]
    
    @State var text: String = ""
    @State var expand = false
    @State var selectedLabel = "Active"

    var body: some View {
        
        VStack(alignment: .leading, spacing: 8){
//            Text("Effects:")
//                .font(.system(size:40))
//                .foregroundColor(.gray)
            ForEach(EffectsActives) { EffectsActive in
              HStack {
                
                Text(EffectsActive.isChecked ? Image(systemName: "checkmark.square.fill") : Image(systemName: "square.fill"))
                    .font(.system(size: 25))
                    .onTapGesture{
                        if  selectedLabel != "Active " , expand == false{
                            selectedLabel = "Active"
                            EffectsActives[0].isChecked = false
                        }
                    }
    //            Spacer()
               Text(self.selectedLabel)
                    .font(.system(size:21))
//                            Spacer()
//
//                TextFieldView()
//                    .textContentType(.oneTimeCode)
//                       .keyboardType(.numberPad)
//                    .frame(width:90, height: 50)
//                    .fixedSize()
                   
              }
              //.padding()
              
    //          .background(Color.white) // This makes the entire row clickable
                     .onTapGesture {
                       if let matchingIndex =
                         self.EffectsActives.firstIndex(where: { $0.id == EffectsActive.id })
                       {
                        //self.EffectsActives[matchingIndex].isChecked.toggle()
                        
                       }
                        
                        
                       
                        
                        self.expand.toggle()
                     }
                        
                            
                VStack{
                if expand{
                    let matchingIndex =
                      self.EffectsActives.firstIndex(where: { $0.id == EffectsActive.id })
                        Button(action: {
                            print("1")
                            self.expand.toggle()
                            self.selectedLabel = "Hyperactive"
                            self.EffectsActives[matchingIndex!].isChecked = true
                            self.selectedActive = self.selectedLabel
                                
                            })//:BUTTON
                        {
                            Text("\(OPTION.hyperactive.rawValue)")
                            .padding()
                        }.foregroundColor(.black)

                    Button(action: {
                        print("2")
                        self.expand.toggle()
                        self.selectedLabel = "Hypoactive"
                        self.EffectsActives[matchingIndex!].isChecked = true
                        self.selectedActive = self.selectedLabel
                        })//:BUTTON
                    {
                        Text("\(OPTION.hypoactive.rawValue)")
                        .padding()
                    }.foregroundColor(.black)
                    
                

                }//:If
                }//:VSTACK-IF
                       
                     
                   }
            
    //               .onDelete(perform: deleteListItem)
    //               .onMove(perform: moveListItem)
                 }
//        .frame(width: .infinity, height: 50, alignment: .leading)
    //             .navigationBarItems(trailing: EditButton())
    //             .navigationBarTitle("Checklist")
                 .onAppear() {
            }
          
        }
      }



func checkSelected(id: String, isMarked: Bool) {
    print("\(id) is marked: \(isMarked)")
}


struct EffectsActive_Previews: PreviewProvider {
    static var previews: some View {
        EffectsActive(selectedActive: .constant(""))
        
    }
}
