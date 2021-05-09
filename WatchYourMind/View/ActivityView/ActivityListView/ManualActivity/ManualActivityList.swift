//
//  ManualActivityList.swift
//  WatchYourMind
//
//  Created by Gatang on 14/3/2564 BE.
//

import SwiftUI

class Measurement: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: MeasurementView? //= nil
}


struct ManualActivityList: View {
    
    @State private var isSelected = true
    @ObservedObject var arr : ManualActivtyViewModel = ManualActivtyViewModel()
    @State var showSheetView = false

    @State var activityData = ManualActivityModel(id: "", createby: "", title: "", description: "", createDate: Date(), type: "", imageicon: "", link: "", pic: "", outcome:[])
    
    @State var iSSave : Bool = false
    @State var isIphone: Bool = false
    
    @ObservedObject var activityStore = ActivityStore()
    
//    let feedback = UIImpactFeedbackGenerator(style: .heavy)
//    @EnvironmentObject var measurement: Measurement
    

    var body: some View {
        ZStack{
//            if measurement.showingProduct == false{

            
            VStack{
            ScrollView(.vertical, showsIndicators: false) {
                
//                NavigationBarManualActivityList()

            if !isIphone{ // iPad mac
                HStack(alignment:.top){
                    AutoActivityList(isSelectedAuto: .constant([]))
                        .padding(.trailing,100)
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
//                        .padding(.trailing,100)

                    }
                    Text("\(self.activityStore.maualActivityList.count) Activities")
                }//:VStack
                Button(action: {
           self.showSheetView.toggle()
       }){
                   
           Image(systemName: "plus")
               .font(.system(size: 40, weight: .regular))

               .foregroundColor(.purple)
               
//            .background(Color.gray)
//               .padding(.leading,0)
          

               
                  .clipShape(Circle())
            .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.white)
            
            .cornerRadius(100)
            .shadow(radius: 8 )
       }
                .padding()
            }//:HStack
           
          
                
                
                VStack(alignment: .leading) {

    //                if !isSelected {
                    ScrollView(.vertical, showsIndicators: false, content:{
                        
                        ForEach(self.activityStore.maualActivityList) { item in
                            if item.type == "MANUAL"{
                                ManualActivityFlipView(activityName: item.title , assined:"\(item.count)", create: item.createdDate,  description: item.description)
                                    .padding()
                            }
                        
                       

                                
                      
           
                    }
                        
                    })

                    
//                    HStack{
//
//                    Button(action: {
//
//                    }, label: {
//                        Image(systemName: "chevron.forward")
//                            .scaledToFit()
//                             .fixedSize()
//                             .foregroundColor(.black)
//
//                            .frame(width: 20, height: 20)
//                            .padding()
//                            .background(Color.white)
//                            .frame(width: 40, height: 40)
//                            .cornerRadius(100)
////                            .onTapGesture {
////                              feedback.impactOccurred()
////                                measurement.showingProduct = true
////                            }
//
//                    }) //: BUTTON-NEXT
//
////                    }//:ZSTACK
//
//
//
//                    }//:HSTACK

                                }
                            
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
                    AutoActivityList(isSelectedAuto: .constant([]))
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
                
            }

                VStack(alignment: .leading) {
    //                if !isSelected {
                    ScrollView(.vertical, showsIndicators: false, content:{
                        ForEach(self.activityStore.maualActivityList) { item in
                        
                            ManualActivityFlipView(activityName: item.title, assined: "\(item.count)", create: item.createdDate, description: item.description)
                            
                        .padding()
                            
                    }
                    })

                    HStack{
                        
                    Button(action: {
                                    self.showSheetView.toggle()
                                }){
                                    Image(systemName: "plus")
                                }
                                .padding()
    
//                   ZStack {
                       
                    Button(action: {
//                            self.selectedTag = "xx"

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
//                            .onTapGesture {
//                              feedback.impactOccurred()
//
//                                measurement.showingProduct = true
//                            }

                    }) //: BUTTON-NEXT


                        
                        
                    }//:HSATCK
                    
                    
                                }
                            
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
                
                

            }
                
        
            
//        }
            .onAppear(perform: {
                if UIDevice.current.userInterfaceIdiom == .phone{
                   isIphone = true
                }else{
                    isIphone = false
                }
                print(isIphone)
            })//:onAppear
            .navigationBarTitle("ActivityListView", displayMode: .inline)
            
//        }
//        else{
//            MeasurementView()
//        }
        }
    }
}

struct ManualActivityList_Previews: PreviewProvider {
    static var previews: some View {
        ManualActivityList()
//            .environmentObject(Measurement())
                    
    }
}
