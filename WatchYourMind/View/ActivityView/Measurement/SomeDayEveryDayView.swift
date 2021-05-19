//
//  SomeDayEveryDayView.swift
//  WatchYourMind
//
//  Created by Gatang on 22/3/2564 BE.
//

import SwiftUI


struct SomeDayEveryDayView: View {
    @Binding var activity : [ActivityModel]
    let seletedAnActivity : ActivityModel
    
    @State var isEveryDay : Bool = false
    @State var isSomeDay : Bool = false
  
    @State var isNotnumber : Bool = true
    
    
    @State var time : Int = 30
    @State var round : Int = 1
    @State var NoOfDays : Int = 1
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading){
                //everyday
                VStack(alignment: .leading){
                    Button(action: {
                        isEveryDay = true
                        if isEveryDay == true && isSomeDay == true {
                            isSomeDay = false
                        }
                    }, label: {
                        HStack{
                            Image(systemName: isEveryDay ? "checkmark.circle.fill" : "circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("EveryDay")
                                .font(.system(size:21))
                        }
                    }).padding(.bottom)
                    if isEveryDay == true {
                        VStack(alignment: .leading){
    

                        HStack {
                            NumberPickerView(value: self.$time, unit: "Minutes / Day")
                        }
                        
                        HStack {
   
                            NumberPickerView(value: self.$round, unit: "Time(s)/Day")
                                            
                                          
                        }
                        .onAppear(perform: {
                            if self.activity.count > 0{
                                for i in 0...self.activity.count-1{
                                    if self.seletedAnActivity.id == self.activity[i].id{
                                        self.activity[i].setTime(self.time)
                                        self.activity[i].setRound(self.round)
                                        self.activity[i].setNumberOfDays(nil)
                                        
                                    }
                                }
                            }
                        })
                        
                                        

                  
                        }//:VSTACK
                        .zIndex(1)
                        

                    }
                    
                }
                
                
                
                //someday
                VStack(alignment:.leading) {
                    Button(action: {
                        isSomeDay = true
                        if isSomeDay == true && isEveryDay == true {
                            isEveryDay = false
                        }
                    }, label: {
                        HStack{
                            Image(systemName: isSomeDay ? "checkmark.circle.fill" : "circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("SomeDay")
                                .font(.system(size:21))
                        }
                }).padding(.bottom)
                 
                    if isSomeDay{
                       
                        VStack(alignment: .leading){
                            
                           
                            
                            HStack {
                                NumberPickerView(value: self.$time, unit: "Minutes / Day")
                            }
                            HStack {
       
                                NumberPickerView(value: self.$round, unit: "Time(s)/Day")
                                                
                                              
                            }
                        
                        HStack {
                                     
                                           
                            NumberPickerView(value: self.$NoOfDays, unit: "number of days")
                        }
                            
                        }
                        .zIndex(1)
                        .onAppear(perform: {
                            if self.activity.count > 0{
                                for i in 0...self.activity.count-1{
                                    if self.seletedAnActivity.id == self.activity[i].id{
                                        self.activity[i].setTime(self.time)
                                        self.activity[i].setRound(self.round)
                                        self.activity[i].setNumberOfDays(self.NoOfDays)
                                    }
                                }
                            }
                        })
                        
                        
                    }
                }
            }
           
        }
       
        .fixedSize()
        .onAppear(perform: {
       print("appear back card")
            if self.activity.count > 0{
                for i in 0...self.activity.count-1{
                    if self.seletedAnActivity.id == self.activity[i].id{
                        self.activity[i].setQuantify(everyDay: true, round: self.round, time: self.time)
                        print("appear set \(self.round),\(self.time)")
                    }
                }
            }
            
            
        })
        .onChange(of: self.time, perform: { value in
            
                if self.activity.count > 0{
                    for i in 0...self.activity.count-1{
                        if self.seletedAnActivity.id == self.activity[i].id{
                            self.activity[i].setTime(self.time)
                            print("set time \(self.time)")
                        }
                    }
                }
                
            
        })
        .onChange(of: self.round, perform: { value in
            
                if self.activity.count > 0{
                    for i in 0...self.activity.count-1{
                        if self.seletedAnActivity.id == self.activity[i].id{
                            self.activity[i].setRound(self.round)
                            print("set round \(self.round)")
                        }
                    }
                }
        })
        .onChange(of: self.NoOfDays, perform: { value in
            if isSomeDay{
                if self.NoOfDays > 0{
                    if self.activity.count > 0{
                        for i in 0...self.activity.count-1{
                            if self.seletedAnActivity.id == self.activity[i].id{
                                self.activity[i].setNumberOfDays(self.NoOfDays)
                                print("set no of days \(self.NoOfDays)")
                            }
                        }
                    }
                }
                
            }
        })
        .onChange(of: isEveryDay, perform: { value in
            var isEv = false
            if isEveryDay {
                isEv = true
                
            }else{
                isEv = false
            }
            
            if self.activity.count > 0{
                for i in 0...self.activity.count-1{
                    if self.seletedAnActivity.id == self.activity[i].id{
                        self.activity[i].setIsEveryday(isEv)
                        if isEv {
                            self.activity[i].setNumberOfDays(nil)
                        }
                    }
                }
            }
            
        })
        .onChange(of: isSomeDay, perform: { value in
            var isEv = false
            if isSomeDay{
                isEv = false
            }else{
                isEv = true
            }
            if self.activity.count > 0{
                for i in 0...self.activity.count-1{
                    if self.seletedAnActivity.id == self.activity[i].id{
                        self.activity[i].setIsEveryday(isEv)
                        if isEv{
                            self.activity[i].setNumberOfDays(nil)
                        }
                        
                    }
                }
            }
        })

    }
}
struct Wranning : View {
    let label : String
    var body: some View{
        HStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.footnote)
                .foregroundColor(.red)
            Text(label)
                .font(.footnote)
                .fontWeight(.regular)
                .foregroundColor(.red)
        }
    }
}

struct SomeDayEveryDayView_Previews: PreviewProvider {
    static var previews: some View {
        SomeDayEveryDayView(activity: .constant([]), seletedAnActivity: ActivityModel(createdby: "koi", description: "hello hello", imageIcon: "gamer", title: "Music Relexation1", type: "MANUAL", createdDate: Date(), dockey: "key")).previewLayout(.sizeThatFits)
    }
}
extension View {
   func endEditing() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
