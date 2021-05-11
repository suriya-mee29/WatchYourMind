//
//  SomedayStepperTextFieldDay.swift
//  WatchYourMind
//
//  Created by Gatang on 12/5/2564 BE.
//

import SwiftUI

struct SomedayStepperTextFieldDay: View {
    @State var quantity: Int = 0
    @State private var editing = false
        static let formatter = NumberFormatter()
    var TimeString: String = ""

        var input: Binding<String> {
            .init(get: {
                "\(self.quantity)"
            }, set: {
                self.quantity = Int($0) ?? self.quantity
            })
        }
    @State private var fullText: String = ""
    init() {
           UITextView.appearance().backgroundColor = .clear
       }
    var body: some View {
        VStack(alignment:.center){
        HStack(alignment: .center) {
            VStack(alignment:.center){
                TextField("", text: input, onEditingChanged:{  edit in
                    self.editing = edit
                })
                
                .font(Font.system(size: 30, design: .default))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width:50)
                
//                VStack{
           
            }
            Text("Day(s)/Week")
                .font(.title)
            Stepper("", onIncrement: {
                self.quantity += 1
            }, onDecrement: {
                if quantity != 1{
                self.quantity -= 1
                    
                }
            })
            .frame(width:100)
//            Spacer()
        }//:HSATCK
        .frame(width:700)
            if quantity <= 0{
Text("Do an Activity when you feel ...")
    .font(.title2)
    .foregroundColor(.purple)
                TextEditor(text: $fullText)
                    .frame(width: 300, height: 100, alignment: .center)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.init( red: 45/255, green: 0/255, blue: 112/255), lineWidth: 1))
                    .lineSpacing(10)
                    .onTapGesture {
                        hideKeyboard()
                    }
                    
                    
            
            }//:if
        }
        
        .fixedSize(horizontal: true, vertical: false)
        
    }
}

struct SomedayStepperTextFieldDay_Previews: PreviewProvider {
    static var previews: some View {
        SomedayStepperTextFieldDay()
    }
}
