//
//  NumberPickerView.swift
//  WatchYourMind
//
//  Created by Suriya on 16/5/2564 BE.
//

import SwiftUI

struct NumberPickerView: View {
    @Binding var value : Int
    let unit : String
    var body: some View {
      
            HStack {
               
              
                VStack{
                    Button(action: {
                        self.value += 1
                    }, label: {
                        Image(systemName: "arrowtriangle.up.fill")
                            .font(.title2)
                    })
                    Button(action:{
                        if self.value > 0{
                            self.value -= 1
                        }
                    }, label: {
                        Image(systemName: "arrowtriangle.down.fill")
                            .font(.title2)
                    })
                  
                }
                Text("\(value)")
                Text(self.unit)
                
            }
            .padding(.bottom)
        
    }
}

struct NumberPickerView_Previews: PreviewProvider {
    static var num : Int = 0
    static var previews: some View {
        NumberPickerView(value: .constant(0), unit: "Minutes / Day")
    }
}
