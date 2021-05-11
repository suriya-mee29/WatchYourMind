//
//  Frequency.swift
//  WatchYourMind
//
//  Created by Gatang on 17/3/2564 BE.
//

import SwiftUI

extension Color {
    static let darkPink = Color(red: 208 / 255, green: 45 / 255, blue: 208 / 255)
}

extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle()
                        .frame(height: 2)
                        .padding(.top, 35))
            .foregroundColor(.gray)
            .padding(10)
    }
}

struct Frequency: Identifiable {
  let id = UUID()
  var name: String
  var isChecked: Bool = false
}



enum Time : String{
    case EveryDay = "EveryDay"
    case SomeDay = "SomeDay"
    
}

struct FrequencyActivityView: View {
    
    @State var StartEveryDays = [
        Frequency(name: "EveryDay"),
//        Frequency(name: "SomeDay")
        //        Active(name: "Hypoactive" )
        //        Active(name: "Hyperactive")
            
    ]
    
    @State var text: String = ""
    @State var expandEvery = false
    @State var selectedLabel = "Frequency"
    
    
    
    var body: some View {
        VStack(alignment: .center){
            ForEach(StartEveryDays) { StartEveryDay in
                HStack {

                    Image(systemName: expandEvery ? "checkmark.circle.fill" : "circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text(StartEveryDay.name)
                        .font(.system(size:21))
                    .onTapGesture {
                        self.expandEvery.toggle()
                    }
                        .onTapGesture{
                            if  StartEveryDay.name != "EveryDay" , expandEvery == false{
                            selectedLabel = "EveryDay"; StartEveryDays[0].isChecked = false

                        }



                }//:onTapGesture
                    
                }//HSTACK
                .padding(.vertical)
                .onTapGesture {
                    if self.StartEveryDays.firstIndex(where: { $0.id == StartEveryDay.id }) != nil{
                        
                        expandEvery = false
           
                  }

                   self.expandEvery.toggle()
                    
                }
                VStack{
                if expandEvery{

                    VStack(alignment: .leading){
//                        Effects()

//
//                        StepperTextField(TimeString:"Minutes / Day")
                        EverydayStepperTextFieldMinutes(quantity: 0)
                        EverydayStepperTextFieldTime()
                    }//:VSTACK
                    
                

                }//:If
                    
                }
               
                
            }//:Foreach
        
        }//:VSTACK
    }
        
        

}



struct FrequencyActivityView_Previews: PreviewProvider {
    static var previews: some View {
        FrequencyActivityView()
    }
}
