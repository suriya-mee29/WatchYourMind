//
//  MeasurementView.swift
//  WatchYourMind
//
//  Created by Gatang on 16/3/2564 BE.
//

import SwiftUI
extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    
}
struct CheckIndicator: Identifiable {
  let id = UUID()
  var name: String
  var isChecked: Bool = false
    
    var typeObservedStr : String{
        switch self.name {
        case "Sleep" : return "sleeping"
        case "Stepping" : return "stepping"
        case "Burning" : return "burning"
        case "Standing" : return "standing"
        default:
            return "sleeping"
        }
    }
    
}

extension UIScreen{
   static let Widthscreen = UIScreen.main.bounds.size.width
   static let Heightscreen = UIScreen.main.bounds.size.height
   static let Sizescreen = UIScreen.main.bounds.size
}

struct MeasurementView: View {
    @EnvironmentObject var shop :Shop
    @EnvironmentObject var ManualList : ManualList
    @EnvironmentObject var measurement : Measurement
    @EnvironmentObject var listClientRequest : ListClientRequest
    @EnvironmentObject var preact : Preact
    
     var assignmentVM = AssignmentViewModel()
    
    @State var showBanner:Bool = false
    @State var appDate : Date = Date()
    @State var endDate : Date = Date()
    @State var bannerData: BannerModifier.BannerData = BannerModifier.BannerData(title: "Notification Title", detail: "Notification text for the action you were trying to perform.", type: .Warning)
    
    @State var checklistindicator = [
        CheckIndicator(name: "Sleep"),
        CheckIndicator(name: "Stepping"),
        CheckIndicator(name: "Burning"),
        CheckIndicator(name: "Standing")
       
       ]

    @State private var gridLayout: [GridItem] = [ GridItem(.flexible())]
    
    @State var selectedActivities : [ActivityModel]
    let client : UserModel
    @State var preActivityModel : PreActivityModel
    let assignee = UserDefaults.standard.string(forKey: "CURRENT_USER")
 

 // MARK: - function
    func isEmptyChecklistIndicator ()->Bool{
        for i in 0...(self.checklistindicator.count-1){
            if self.checklistindicator[i].isChecked == true {
                return false
            }
        }
        return true
    }
    func errorMessage(title : String , detial : String){
        self.bannerData.type = .Error
        self.bannerData.title = title.uppercased()
        self.bannerData.detail = detial
        self.showBanner = true
    }
    func getObservedIncator()->[String]{
        var arr = [String]()
        if self.checklistindicator.count > 0{
            for i in 0...self.checklistindicator.count-1{
                if self.checklistindicator[i].isChecked{
                arr.append(self.checklistindicator[i].typeObservedStr)
                }
            }
            return arr
        }else{
            return arr
        }
    }

    var body: some View {
        
        if measurement.showingProduct {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {

                    VStack(alignment: .center){
                        NavigationBarMeasurement()
                       
                        HStack(alignment: .center) {
                            
                            VStack(alignment: .center) {
                              
                                Image("\(client.data.prefixname == "Mr" ? "gamer" : "gamer-2" )")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .padding(.horizontal,8)
                                    .clipShape(Circle())
                                    .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
                                    .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
                            }//:VSTACK
                                    .padding(.bottom,10)
                        
                        
//                        HStack {
                            VStack(alignment: .leading, spacing: 0){
                              
                                HStack {
                                    Text("Name TH:")
                                    
                                    
                                    Text("\(client.data.displayname_th)")
                                }.padding(.bottom,3)
                                HStack {
                                    Text("Name EN:")
                                    
                                    
                                    Text("\(client.data.displayname_en)")
                                }.padding(.bottom,3)
                                HStack {
                                    Text("E-mail:")
                                    
                                  
                                    Text("\(client.data.email)")
                                }.padding(.bottom,3)
                                HStack {
                                    Text("Faculty:")
                                    
                                    Text("\(client.data.faculty)")
                                }.padding(.bottom,3)
                                HStack {
                                    Text("Branch:")
                                    
                                   
                                    Text("\(client.data.department)")
                                }
                               

                            }//:VSTACK
                            
//                        }
//                            Spacer()
                           
//                                                       .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
//                            VStack(alignment: .center, spacing: 4) {
//                                Button(action: {
//                                    if Calendar.current.isDateInToday(self.endDate) || Calendar.current.isDateInToday(self.appDate){
//                                        self.errorMessage(title: "date invalide", detial: "Please select end date and appointment date")
//                                    }else{
//                                        if isEmptyChecklistIndicator(){
//                                            self.errorMessage(title: "Timeline Indicator invalide", detial: "lost of timeline indicator, Please select timeline indicator")
//                                        }else{
//                                            for i in 0...self.selectedActivities.count-1{
//                                               if self.selectedActivities[i].everyDay == nil {
//                                                self.errorMessage(title: "activity invalide", detial: "activity name : \(self.selectedActivities[i].title) lost of everyday or somedays indicator")
//                                                    break
//                                               }else{
//                                                if self.selectedActivities[i].everyDay == false && self.selectedActivities[i].NoOfDate == nil {
//                                                    self.errorMessage(title: "activity invalide", detial: "activity name : \(self.selectedActivities[i].title) lost of number days")
//                                                    break
//                                                }else{
//                                                    // save data
//                                                    let assignmentData :[String:Any] = [
//                                                        "appointmentDate": self.appDate,
//                                                        "endDate": self.endDate,
//                                                        "observed" : self.getObservedIncator(),
//                                                        "startDate": Date()
//                                                    ]
//                             print("save")
////                                                    self.assignmentVM.assignment(preActivity: self.preActivityModel.getdate(), clientUsername: self.client.data.userName, assignee: self.assignee!, assignment: assignmentData) { success, msg in
////                                                        if success{
////
////                                                        }else{
////
////                                                        }
////                                                    }
//                                                }
//                                               }
//
//                                            }
//                                        }
//
//                                    }
//
//
//
//                                }) {
//                                    HStack {
//                                        Text("SEND")
//                                        Image(systemName: "paperplane")
//                                    }
//                                }
//                            }
//                            .buttonStyle(neumorphic(color: Color.background))
//                           .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)

                            
//                                .padding(.top,100)
//                                .padding(.trailing,150)
                        }
                        
//BUTTON
                        Button(action: {
                            DispatchQueue.main.async {
                                // save data
                                let assignmentData :[String:Any] = [
                                    "appointmentDate": self.appDate,
                                    "endDate": self.endDate,
                                    "observed" : self.getObservedIncator(),
                                    "startDate": Date()
                                ]
                               print("save")
                                self.assignmentVM.assignment(preActivity: self.preActivityModel.getdate(), clientUsername: self.client.data.userName, assignee: self.assignee!, assignment: assignmentData, selectedActivity: self.selectedActivities) { success, msg in
                                    if success{
                                       // go home
                                        self.measurement.showingProduct = false
                                        self.ManualList.showingPage = false
                                        self.preact.showingProduct = false
                                        self.shop.showingProduct = false
                                        self.listClientRequest.showingProduct = false
                                    }else{
                                        
                                    }
                                }
                            }
                        }, label: {
                            HStack{
                                Text("send".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("IconTabBar"))
                                Image(systemName: "paperplane")
                            }
                        })
                        .buttonStyle(neumorphic(color: Color.background))
                        .padding(.leading,500)
                        
                        VStack(alignment: .center){
                        HStack{
                            VStack(alignment:.center) {
                                Text("ACTIVITY")
                                    .font(.system(size: 20))
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.gray)
                            
                            }//:VSTACK
                            Text("(\(self.selectedActivities.count))")
                                .foregroundColor(.gray)
                        } //: HSTACK
                            HStack{
                            HStack{
                                Image(systemName: "pin")
                                Text("End date:")
                                ParentDatePicker(currentDate: self.$endDate)
                            }//:HSTACK
                            
                            HStack {
                                Image(systemName: "alarm")
                                Text("Appointment:")
                                ParentDatePicker(currentDate: self.$appDate)
                            }.padding(.bottom,3)
                            }
                            
                            
                            
                        }
                       
                        .frame(width: UIScreen.Widthscreen,height: 100 )
                        
                        //        .background(Color("bg-2"))
                        
                        
                        VStack(alignment:.leading){
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(alignment:.center) {
//                                HStack{
                                Text("Timeline INDICATOR".uppercased())
                                    .font(.system(size: 20))
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.gray)
                                    Text("*(Please select at least 1 timeline indicator.)*")
                                        .font(.system(size: 14))
                                        .foregroundColor(.red)
//                            }//Hstack
                                    HStack{
                                    ForEach(checklistindicator) { checklistIndicator in
                                        HStack(alignment: .center) {
                                            Text(checklistIndicator.isChecked ? Image(systemName: "checkmark.square.fill"):  Image(systemName: "square.fill"))
                                                    .font(.system(size: 30))
                                                                    Text(checklistIndicator.name)
                                                    .font(.system(size:15))
                                                    .textContentType(  .oneTimeCode)
                                                    .keyboardType(.numberPad)
                                                                        
                                                                        
                                 
                                                                  
                                                                  }//HSTACK
                                        
                                        
                                                .onTapGesture {
                                                if let matchingIndex =
                                                    self.checklistindicator.firstIndex(where: { $0.id == checklistIndicator.id }) {
                                                    self.checklistindicator[matchingIndex].isChecked.toggle()
                                                                           }
                                                                         }//: onTapGesture

                                            

                                            }//:LOOP
                                    .padding(.trailing,10)
                                    .padding(.top)
                                    }//:HSTACK
                            
                            }//:VSTACK
                           
                                
                            FlipMeasureView(selectedActivities: self.$selectedActivities)
                            .frame(width: UIScreen.Widthscreen, height: UIScreen.Height, alignment: .center)
                            }//:ZStack
                            .padding()
                        }//:ScrollView
                       
                        }//VSTACK
                    }
                    
        }.banner(data: $bannerData, show: $showBanner)
          .edgesIgnoringSafeArea(.all)

        }
    }
            
          
}

struct MeasurementView_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementView( selectedActivities: [], client: UserModel(timestamp: 1, status: true, message: "ok", data: DataUserModel(type: "std", statusid: "11", statusname: "dddd", userName: "dddd", prefixname: "ddd", displayname_th: "dddd", displayname_en: "ddd", email: "dddd", department: "ddd", faculty: "dddd")), preActivityModel: PreActivityModel(presentation: "", precipitance: [String:[String:Bool]](), pattern: "", faultyThinking: "", intensityLevel: 43.2, emotionLevel: "", event: "", stateProblem: 2))
            .environmentObject(Shop())
            .environmentObject(ManualList())
            .environmentObject(Measurement())
            .environmentObject(ListClientRequest())
            .environmentObject(Preact())
    }
}
//
