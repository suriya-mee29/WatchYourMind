//
//  FrequencyActivityView:.swift
//  WatchYourMind
//
//  Created by Gatang on 22/3/2564 BE.
//

import SwiftUI

extension Color {
    static let darkPink2 = Color(red: 208 / 255, green: 45 / 255, blue: 208 / 255)
}

extension View {
    func underlineTextField2() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle()
                        .frame(height: 2)
                        .padding(.top, 35))
            .foregroundColor(.gray)
            .padding(10)
    }
}
struct Frequency2: Identifiable {
  let id = UUID()
  var name: String
  var isChecked: Bool = false
}

enum Time2 : String{
    case EveryDay = "EveryDay"
    case SomeDay = "SomeDay"
    
}

struct FrequencyActivityView2: View {
    
    @State var StartSomeDays = [
        Frequency2(name: "SomeDays"),
//        Frequency2(name: "EveryDay"),

        ]
    @State var text: String = ""
    @State var expandSome = false
    @State var selectedLabel = "Frequency"
    
    var body: some View {
        VStack(alignment: .leading){
            ForEach(StartSomeDays) { StartSomeDay in
                HStack {
                    Image(systemName: expandSome ? "checkmark.circle.fill" : "circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text(StartSomeDay.name)
                        .font(.system(size:21))
                        .onTapGesture {
                            self.expandSome.toggle()
                        }//:onTapGesture
                    
                        .onTapGesture{
                            if  StartSomeDay.name != "SomeDay" , expandSome == false{
                            selectedLabel = "SomeDay"; StartSomeDays[0].isChecked = false

                        }
                }//:onTapGesture
                    
                }//:HSTACK
                .padding(.vertical)
                .onTapGesture {
                    if self.StartSomeDays.firstIndex(where: { $0.id == StartSomeDay.id }) != nil{
                        
                        expandSome = false
           
                  }
                    self.expandSome.toggle()
                }//:onTapGesture
                
                VStack{
                if expandSome{
                    let matchingIndex =
                      self.StartSomeDays.firstIndex(where: { $0.id == StartSomeDay.id })

                    VStack(alignment: .leading){
                        
                        HStack {
                                        HStack {
                                           
                                            TextFieldView()
                                            .shadow(radius: 3 )
                                            .textContentType(.oneTimeCode)
                                               .keyboardType(.numberPad)
                                                                .textContentType(.oneTimeCode)
                                                                   .keyboardType(.numberPad)
                    //
                                                        }.frame(width: 80, alignment: .center)
                                            
                                            Text("Day(s)/Week")
                        }
                        
                        
                    HStack {
                                    HStack {
                                       
                                        TextFieldView()
                                        .shadow(radius: 3 )
                                        .textContentType(.oneTimeCode)
                                           .keyboardType(.numberPad)
                                                            .textContentType(.oneTimeCode)
                                                               .keyboardType(.numberPad)
                //
                                                    }.frame(width: 80, alignment: .center)
                                        
                                        Text("Minutes / Day")
                    }
                    
                    HStack {
                                    HStack {
                                       
                                        TextFieldView()
                                        .shadow(radius: 3 )
                                        .textContentType(.oneTimeCode)
                                           .keyboardType(.numberPad)
                                                            .textContentType(.oneTimeCode)
                                                               .keyboardType(.numberPad)
                //
                                                    }.frame(width: 80, alignment: .center)
                                        
                                        Text("Time(s)/Day")
                    }
                    }
                                    

              
                    }
                    
                

                }
                
                
            }//:ForEach
        }//:VSTACK
    }
}

struct FrequencyActivityView2_Previews: PreviewProvider {
    static var previews: some View {
        FrequencyActivityView2()
    }
}
