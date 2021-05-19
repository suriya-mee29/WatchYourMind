////
////  ManualActivityList.swift
////  WatchYourMind
////
////  Created by Gatang on 14/3/2564 BE.
////
//
import SwiftUI


class Measurement: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: MeasurementView?
}



struct ManualActivityList: View {
    
    let preActivityModel : PreActivityModel
    @State var selectedActivities = [ActivityModel]()
    let client : UserModel
    
    @State private var isSelected = true
    @ObservedObject var arr : ManualActivtyViewModel = ManualActivtyViewModel()
    @State var showSheetView = false

    @State var activityData = ManualActivityModel(id: "", createby: "", title: "", description: "", createDate: Date(), type: "", imageicon: "", link: "", pic: "", outcome:[])
    
    @State var iSSave : Bool = false
    @State var isIphone: Bool = false
    
    @ObservedObject var activityStore = ActivityStore()
    
    let feedback = UIImpactFeedbackGenerator(style: .heavy)
    @EnvironmentObject var measurement: Measurement
    

    var body: some View {
        ZStack{
            if measurement.showingProduct == false{
            VStack{
            ScrollView(.vertical, showsIndicators: false) {
                
                NavigationBarManualActivityList()
                
            if !isIphone{ // iPad mac
                HStack(alignment:.top){
                    
                    VStack(alignment: .leading, spacing: 0){
                            
            //                ScrollView(.vertical, showsIndicators: false, content: {

                        HStack {
                            
                            Image(systemName: "circle")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.yellow)

                            VStack(alignment:.leading, spacing: 0) {
                                Text("Auto Activity")
                                    .font(.system(size: 30))
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Text("\(self.activityStore.activityList.count) Activities")
                            }
                        
                        }
                            VStack(alignment: .leading) {
                                ScrollView(.vertical, showsIndicators: false, content:{
                                    
                                    ForEach(self.activityStore.activityList) { item in
                                        if item.type == "AUTO"{
                                            ManualActivityFlipView(selectedActivities: self.$selectedActivities, currentActivity: item)
                                                .padding()
                                        }
                       
                                }
                                    
                                })
                       
                            }

                    } .padding()
                    
            VStack(alignment: .leading, spacing: 0){

                HStack {
                    
                    Image(systemName: "circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.red)

                    VStack(alignment:.leading, spacing: 0) {
                        HStack{
                        Text("Manual Activity")
                            .font(.system(size: 30))
                            
                            .font(.title)
                            .fontWeight(.bold)
                            .fixedSize(horizontal:true, vertical:false)
                        }//:HSTACK
                    
                        Text("\(self.activityStore.maualActivityList.count) Activities")
                    }//:VSTACK
                    
 
                    Button(action: {
               self.showSheetView.toggle()
           }){
               Image(systemName: "plus")
                   .font(.system(size: 40, weight: .regular))

                   .foregroundColor(.purple)

                      .clipShape(Circle())
                .frame(width: 60, height: 60, alignment: .center)
                .background(Color.white)
                
                .cornerRadius(100)
                .shadow(radius: 8 )
           }
                .padding()
                    
                    Button(action: {

                    }, label: {
                        Image(systemName: "chevron.forward")
                            .font(.system(size: 40, weight: .regular))
                            .foregroundColor(.purple)
                               .clipShape(Circle())
                         .frame(width: 60, height: 60, alignment: .center)
                         .background(Color.white)
                         
                         .cornerRadius(100)
                         .shadow(radius: 8 )
                            .onTapGesture {
                              feedback.impactOccurred()
                                measurement.showingProduct = true
//                                  }
                            }

                    }) //: BUTTON-NEXT
            }//:HStack
           
          
                
                
                VStack(alignment: .leading) {

    //                if !isSelected {
                    ScrollView(.vertical, showsIndicators: false, content:{
                       
    
                        ForEach(self.activityStore.maualActivityList) { item in
                            if item.type == "MANUAL"{
                                ManualActivityFlipView(selectedActivities: self.$selectedActivities, currentActivity: item)
                                    .padding()
                            }//:IF
                    }//:LOOP
                        
                    })//:ScrollView

                    HStack{
          

                        
                        
                    }
                                }//:VSTACK
                            
                            .sheet(isPresented: $showSheetView) {
                                NewActivityView(iSSave: $iSSave, activityData: $activityData, showSheetView: $showSheetView )
                            }
                            .onChange(of: showSheetView, perform: { value in
                                if iSSave  {
                                    arr.AddActivity(manualActivityModel: activityData)
                                iSSave = false
                                }
                            })

            }//:VSTACK
                }//:HSTACK
            }//:IF
            else{
                
                VStack{
                    VStack(alignment: .leading, spacing: 0){
                            

                        HStack {
                            
                            Image(systemName: "circle")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.yellow)

                            VStack(alignment:.leading, spacing: 0) {
                                Text("Auto Activity")
                                    .font(.system(size: 30))
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Text("\(self.activityStore.activityList.count) Activities")
                            }
                        
                        }
                            VStack(alignment: .leading) {
                                ScrollView(.vertical, showsIndicators: false, content:{
                                    
                                    ForEach(self.activityStore.activityList) { item in
                                        if item.type == "AUTO"{
                                            ManualActivityFlipView(selectedActivities: self.$selectedActivities, currentActivity: item)
                                                .padding()
                                        }
                       
                                }
                                    
                                })
                       
                            }

                    } .padding()
            VStack(alignment: .leading, spacing: 0){


            HStack {
                
                Image(systemName: "circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.red)

                VStack(alignment:.leading, spacing: 0) {
                    Text("Manual Activity")
                        .font(.system(size: 30))
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("\(self.activityStore.maualActivityList.count) Activities")
                }
                
            

                VStack(alignment: .leading) {
                    ScrollView(.vertical, showsIndicators: false, content:{
                       
                        ForEach(self.activityStore.maualActivityList) { item in
                        
                            ManualActivityFlipView(selectedActivities: self.$selectedActivities, currentActivity: item)
                        .padding()
                            
                    }
                    })
                }//:VSATCK
//                    HStack{
                        
                    Button(action: {
                                    self.showSheetView.toggle()
                                }){
                                    Image(systemName: "plus")
                                }
                                .padding()
    
//                   ZStack {
                       
                        Button(action: {
                        }, label: {
                            Image(systemName: "chevron.forward")
                                .scaledToFit()
                                 .fixedSize()
                                 .foregroundColor(.black)
                                .frame(width: 20, height: 20)
                                .padding()
                                .background(Color.white)
                                .frame(width: 40, height: 40)
                                .cornerRadius(100)
                                .onTapGesture {
                                  feedback.impactOccurred()

                                    measurement.showingProduct = true
                                }

                        }) //: BUTTON-NEXT
                        
                  
            
                                }//:HSTACK
                            
                            .sheet(isPresented: $showSheetView) {
                                NewActivityView(iSSave: $iSSave, activityData: $activityData, showSheetView: $showSheetView )
                            }
                            .onChange(of: showSheetView, perform: { value in
                                if iSSave  {
                                    arr.AddActivity(manualActivityModel: activityData)
                                iSSave = false
                                }
                            })

            }//:VSTACK ELSE
                }//:VSTACK
            }//:ELSE
               
                
//                addButton()
            }//:SCROLLVIEW
                
                

            }//:VSTACKบนสุด
                
        
            
//        }
            .onChange(of: self.showSheetView, perform: { value in
                self.activityStore.fetchActivity(isAuto: false) { success, msg in
                    if success {
                        print("appear manual activity")
                    }else{
                        
                    }
                }
                
                self.activityStore.fetchActivity(isAuto: true) { success, msg in
                    if success {
                        print("appear auto activity")
                    }else{
                        
                    }
                }
            })
            .onAppear(perform: {
                if UIDevice.current.userInterfaceIdiom == .phone{
                   isIphone = true
                }else{
                    isIphone = false
                }
                print(isIphone)
                
                
            })//:onAppear
            .navigationBarTitle("ActivityListView", displayMode: .inline)
            
        }//:If
        else{
            
            MeasurementView( selectedActivities:self.selectedActivities, client: self.client, preActivityModel: self.preActivityModel)
        }
            
            
            
        }//:ZSTACK
        .edgesIgnoringSafeArea(.all)
    }
}

struct ManualActivityList_Previews: PreviewProvider {
    static var previews: some View {
        ManualActivityList(preActivityModel: PreActivityModel(presentation: "", precipitance: [String:[String:Bool]](), pattern: "", faultyThinking: "", intensityLevel: 43.2, emotionLevel: "", event: "", stateProblem: 2), client: UserModel(timestamp: 1, status: true, message: "ok", data: DataUserModel(type: "std", statusid: "11", statusname: "dddd", userName: "dddd", prefixname: "ddd", displayname_th: "dddd", displayname_en: "ddd", email: "dddd", department: "ddd", faculty: "dddd")))
            .environmentObject(Measurement())
                    
    }
}

