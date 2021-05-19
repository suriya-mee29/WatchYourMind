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
    ]
    
    @State var text: String = ""
    @State var expandEvery = false
    @State var selectedLabel = "Frequency"
    
    
    
    var body: some View {
        VStack(alignment: .leading){
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

                    HStack {
                         HStack {
//
                            TextFieldView(text: .constant(""))
                        .shadow(radius: 3 )
                        .textContentType(.oneTimeCode)
                           .keyboardType(.numberPad)
                                            .textContentType(.oneTimeCode)
                                               .keyboardType(.numberPad)
//
                                    }.frame(width: 80, alignment: .center)
//                                    .underlineTextField()
//
                                        Text("Minutes / Day")
                    }
//
                    HStack {
                                    HStack {
//
                                        TextFieldView(text: .constant(""))
                                        .shadow(radius: 3 )
                                        .textContentType(.oneTimeCode)
                                           .keyboardType(.numberPad)
                                                            .textContentType(.oneTimeCode)
                                                               .keyboardType(.numberPad)
                
                                                    }.frame(width: 80, alignment: .center)
//
                                        Text("Time(s)/Day")
                    }
                    
                                    

              
                    }//:VSTACK
                    .onAppear(perform: {
                        
                    })
                    
                

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
