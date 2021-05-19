//
//  PreActivity.swift
//  WatchYourMind
//
//  Created by Gatang on 1/3/2564 BE.
//

import SwiftUI

class ManualList: ObservableObject {
  @Published var showingPage: Bool = false
  @Published var selectedPage: ManualActivityList? //= nil
}



struct PreActivity: View {
    @State var header : String = ""
    @State var showAlert : Bool = false
    @State var alertMessage : String = ""
    
    let client : UserModel

    @State var persentationText : String = ""
    @State var patternText : String = ""
    @State var faultyThinkingText : String = ""
    @State var precipitance = [String : [String:Bool]]()
    @State var level : Double = 50.0
    @State var selectedEmotion : String = ""
    @State var periodof : String = ""
    @State var event : String = ""
    
    @State var numberOf_sleep = ""
    @State var numberOf_ex = ""
    @State var activetype = "active"
  
    
    @State var isClicked_sleep = false
    @State var isClicked_exe = false
    @State var isClicked_activetype = false
    
    
    
    
    let colorBackground: Color = Color("bg-1")
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    
    
    let prefeedback = UIImpactFeedbackGenerator(style: .heavy)
    @EnvironmentObject var activitylist: ManualList
    
    @EnvironmentObject var preactivity: Preact
    
    @State var preActivityModel : PreActivityModel?
     
    var body: some View {
        ZStack{
            if activitylist.showingPage == false
            {
            VStack{
                ScrollView(.vertical, showsIndicators: false) {
                    NavigationPreActivity()
              LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {

                VStack(alignment:. leading, spacing: 20) {

                        Text("Ask for basic information before assigning activities.")
                            .font(.system(size:30))
                            .lineLimit(2)
                           .foregroundColor(.black)


                }.padding(.horizontal,3)
                VStack(alignment: .leading,spacing: 0){
                        Text("Add User")
                            .font(.system(size:50))
                            .font(.title)
                    
                    Text("Event:")
                        .font(.system(size:40))
                        .foregroundColor(.black)
                    
                    TextEdit(fullText: self.$event)
                            .shadow(radius: 5 )
                            .padding(.vertical,20)
                            .padding(.horizontal,10)
                    
                        Text("Presentation:")
                            .font(.system(size:40))
                            .foregroundColor(.black)


                    TextEdit(fullText: self.$persentationText)
                            .shadow(radius: 5 )
                            .padding(.vertical,20)
                            .padding(.horizontal,10)
                     Text("Percipitance:")
                        .font(.system(size:40))
                        .foregroundColor(.black)
                    CheckboxView2(precipitance: self.$precipitance)
                    }


                VStack(alignment: .leading, spacing: 8){

                    Text("Pattern:")
                        .font(.system(size:40))
                        .foregroundColor(.black)


                    TextEdit(fullText: self.$patternText)
                        .shadow(radius: 5 )
                        .padding(.vertical,20)
                        .padding(.horizontal,10)
                    }
                VStack(alignment: .leading, spacing: 8){
                Text("Faulty Thinking")
                    .font(.system(size:30))
                    .foregroundColor(.black)
                    .padding(.leading)
                    TextEdit(fullText: self.$faultyThinkingText)
                    .shadow(radius: 5 )
                    .padding(.horizontal,10)
                }
                VStack(alignment: .leading, spacing: 8){
                    Text("Intensity Level: ")
                        .font(.system(size:40))
                        .foregroundColor(.gray)
                    IntensityLevelView(sliderValue: self.$level)
                    }
                        VStack(alignment: .center,spacing: 30) {
                            EmotionView(selected: self.$selectedEmotion)
                        }.padding(.vertical,8)

            
                    VStack{
                        
                        HStack{
                           
                             
                            Button {
                                self.isClicked_sleep.toggle()
                                if self.isClicked_sleep == false {
                                    self.numberOf_sleep = ""
                                }
                                
                            } label: {
                                HStack{
                                    Image(systemName: !self.isClicked_sleep ? "checkmark.square":"checkmark.square.fill")
                                    Text("Hour(s) of sleep / day")
                                }
                            }
                            if isClicked_sleep{
                             TextField("number", text: self.$numberOf_sleep)
                            }
                        }
                        
                        HStack{
                           
                             
                            Button {
                                self.isClicked_exe.toggle()
                                if self.isClicked_exe == false {
                                    self.numberOf_ex = ""
                                }
                                
                            } label: {
                                HStack{
                                    Image(systemName: !self.isClicked_exe ? "checkmark.square":"checkmark.square.fill")
                                    Text("ex / day")
                                }
                            }
                            if isClicked_exe{
                             TextField("number", text: self.$numberOf_ex)
                            }
                        }
                        
                        HStack{
                            Button {
                                self.isClicked_activetype.toggle()
                                if self.activetype != "active"{
                                    self.activetype = "active"
                                }
                                
                            } label: {
                                HStack{
                                    Image(systemName: self.activetype == "active" ? "checkmark.square": "checkmark.square.fill")
                                    Text(self.activetype)
                                }
                            }
                        }
                        if isClicked_activetype{
                            VStack{
                                Button(action: {
                                    self.activetype = "hyperactive"
                                    self.isClicked_activetype = false
                                   
                                }) {
                                    HStack{
                                        Image(systemName: self.activetype == "active" ? "checkmark.square" : "checkmark.square.fill")
                                        Text("hyperactive")
                                    }
                                }
                                Button(action: {
                                    self.activetype = "hypoactive"
                                    self.isClicked_activetype = false
                                }) {
                                    HStack{
                                        Image(systemName: self.activetype == "active" ? "checkmark.square" : "checkmark.square.fill")
                                        Text("hypoactive")
                                    }
                                }
                            }
                        }

                        TextField("The period of the problem", text: self.$periodof)
                        
                    

                        
                    }//VSTACK
                   
               
               
                
//                VStack(alignment: .leading, spacing: 0){
//                            Text("Effect")
//                                .font(.system(size:40))
//                                .foregroundColor(.gray)
//
//                    Effects(selectedActivity: self.$selectedActive, checklistItems: self.$checklistItems)
//                    TheperiodoftheproblemView(text: self.$period)
//
//                        }

                Button(action: {
                }, label: {
                    Image(systemName: "chevron.forward")
                        .scaledToFit()
                        .fixedSize()
                        .foregroundColor(.black)
                        .frame(width: 20, height: 20)
                        .padding()
                        .background(Color("bg-2"))
                        .frame(width: 40, height: 40)
                        .cornerRadius(100)
                        .onTapGesture {
                            //1
                            if !self.persentationText.isEmpty{
                                //3
                                    if !self.patternText.isEmpty{
                                    // 4
                                        if !self.faultyThinkingText.isEmpty{
                                            //5
                                            if !selectedEmotion.isEmpty {
                                                //6
                                                if (isClicked_sleep && !numberOf_sleep.isEmpty) ||
                                                    !isClicked_sleep{
                                                //7
                                                if (isClicked_exe && !numberOf_ex.isEmpty) ||
                                                        !isClicked_exe{
                                                //8
                                                    
                                                if !periodof.isEmpty{
                                                    
                                                    var effact = [String:String]()
                                                    
                                                    if isClicked_sleep{
                                                        if let numSlEEP = Int(numberOf_sleep){
                                                            if numSlEEP > 8{
                                                                effact["sleep"] = "Over sleep, \(numSlEEP) hr."
                                                            }else if numSlEEP < 8{
                                                                effact["sleep"] = "Lower sleep, \(numSlEEP) hr."
                                                            }else{
                                                        effact["sleep"] = "Normal sleep, \(numSlEEP) hr."
                                                            }
                                                        }else{
                                                            effact["sleep"] = "Over sleep or Lower sleep,\(self.numberOf_sleep)"
                                                        }
                                                       
                                                    }
                                                    if isClicked_exe {
                                                        effact["exercise"] = self.numberOf_ex
                                                        
                                                    }
                                                    if self.activetype != "active"{
                                                        effact["activetype"] = self.activetype
                                                    }
                                                    
                                                    //go
                                                   
                                                    self.preActivityModel = PreActivityModel(presentation: self.persentationText, precipitance: self.precipitance, pattern: self.patternText, faultyThinking: self.faultyThinkingText, intensityLevel: self.level, emotionLevel: self.selectedEmotion, event: self.event, stateProblem: Int(self.periodof) ?? 0)
                                                    self.preActivityModel?.setEffact(effact)
                                                    
                                                    prefeedback.impactOccurred()
                                                    self.activitylist.showingPage = true
                                                    
                                                }else{
                                                        print("Plese enter period of problem before you'll submit.")
                                                        self.header = "from invalide"
                                                        self.alertMessage = "Plese enter period of problem before you'll submit."
                                                        self.showAlert = true
                                                    }
                                                        
                                                }
                                               
                                                    
                                                }else{
                                                    print("Plese number of sleep before you'll submit.")
                                                    self.header = "from invalide"
                                                    self.alertMessage = "Plese number of sleep before you'll submit."
                                                    self.showAlert = true
                                                }
                                                   
                                            }else{
                                                print("Plese enter emotion before you'll submit.")
                                                self.header = "from invalide"
                                                self.alertMessage = "Plese enter emotion before you'll submit."
                                                self.showAlert = true
                                            }
                                            
                                            
                                        }else{
                                            print("Plese enter faulty thinking before you'll submit.")
                                            self.header = "from invalide"
                                            self.alertMessage = "Plese enter faulty thinking before you'll submit."
                                            self.showAlert = true
                                        }
                                        
                                    }else{
                                        print("Plese enter pattern factor before you'll submit.")
                                        self.header = "from invalide"
                                        self.alertMessage = "Plese enter pattern factor before you'll submit."
                                        self.showAlert = true
                                    }
                                    
                              
                                
                                
                                
                            }else{
                                print("Plese enter presentation factor before you'll submit.")
                                self.header = "from invalide"
                                self.alertMessage = "Plese enter presentation factor before you'll submit."
                                self.showAlert = true
                            }
                            
                         
                            
                        }
                }) //: BUTTON-NEXT
              }//:LAZYVGRID
              .padding()

              }//SCROLL
              .ignoresSafeArea(.all, edges: .top)
               
            }//:VSTACK
           
    }//:IF
            
        else{
            if let pre = self.preActivityModel{
                ManualActivityList(preActivityModel: pre, client: self.client)
            }
            
        }
            
            
        
        }//:ZStack
        .alert(isPresented: $showAlert , content: {
            Alert(title: Text(self.header.uppercased()), message: Text("\(self.alertMessage)"), dismissButton: .default(Text("OK!")))
                    }
        )
      
        
        
    }//:BODY
}//:struct PreActivity
    
    


struct PreActivity_Previews: PreviewProvider {
    static var previews: some View {
        PreActivity(client: UserModel(timestamp: 1, status: true, message: "ok", data: DataUserModel(type: "std", statusid: "11", statusname: "dddd", userName: "dddd", prefixname: "ddd", displayname_th: "dddd", displayname_en: "ddd", email: "dddd", department: "ddd", faculty: "dddd")))
        .environmentObject(ManualList())
    }
}
