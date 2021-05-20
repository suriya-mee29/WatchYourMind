//
//  ManualActivityList2.swift
//  WatchYourMind
//
//  Created by Gatang on 17/5/2564 BE.
//

import SwiftUI


struct ManualActivityList2: View {
    @State private var isSelected = true
    @ObservedObject var arr : ManualActivtyViewModel = ManualActivtyViewModel()
    @State var showSheetView = false

    @State var activityData = ManualActivityModel(id: "", createby: "", title: "", description: "", createDate: Date(), type: "", imageicon: "", link: "", pic: "", outcome:[])
    
    @State var iSSave : Bool = false
    @State var isIphone: Bool = false
    
    @ObservedObject var activityStore = ActivityStore()
    
    var body: some View {
        VStack{
        ScrollView(.vertical, showsIndicators: false) {
//        if !isIphone{ // iPad mac
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
                
                
                
        }//:HStack
       
      
            
            
            VStack(alignment: .leading) {

//                if !isSelected {
                ScrollView(.vertical, showsIndicators: false, content:{
                    
                    ForEach(self.activityStore.maualActivityList) { item in
                        if item.type == "MANUAL"{
                            ManualActivityFlipView(activityName: item.title , assined:"\(item.count)", create: item.createdDate,  description: item.description)
                                .padding()
                        }//:IF
                }//:LOOP
                    
                })//:ScrollView
                            }//:VSTACK
                        
//                        .sheet(isPresented: $showSheetView) {
//                            NewActivityView(iSSave: $iSSave, activityData: $activityData, showSheetView: $showSheetView )
//                        }
            
//            .sheet(isPresented: $showModal){
//                        ModalView(closeAction: { self.showModal = false })
                        .onChange(of: showSheetView, perform: { value in
                            if iSSave  {
                                arr.AddActivity(manualActivityModel: activityData)
                            iSSave = false
                            }
                        })

        }//:VSTACK
            }//:HSTACK
//        }//:IF
//        else{
//            VStack{
//                AutoActivityList(isSelectedAuto: .constant([]))
//        VStack(alignment: .leading, spacing: 0){
//        HStack {
//
//            Image(systemName: "circle")
//                .resizable()
//                .scaledToFill()
//                .frame(width: 50, height: 50)
//                .foregroundColor(.red)
//
//            VStack(alignment:.leading, spacing: 0) {
//                Text("Manual Activity")
//                    .font(.system(size: 30))
//                    .font(.title)
//                    .fontWeight(.bold)
//
//                Text("\(self.activityStore.maualActivityList.count) Activities")
//            }
//
//
//
//            VStack(alignment: .leading) {
//                ScrollView(.vertical, showsIndicators: false, content:{
//                    ForEach(self.activityStore.maualActivityList) { item in
//
//                        ManualActivityFlipView(activityName: item.title, assined: "\(item.count)", create: item.createdDate, description: item.description)
//
//                    .padding()
//
//                }
//                })
//            }//:VSATCK
//                            }//:HSTACK
//
//                        .sheet(isPresented: $showSheetView) {
//                            NewActivityView(iSSave: $iSSave, activityData: $activityData, showSheetView: $showSheetView )
//                        }
//                        .onChange(of: showSheetView, perform: { value in
//                            if iSSave  {
//                                arr.AddActivity(manualActivityModel: activityData)
//                            iSSave = false
//                            }
//                        })
//
//        }//:VSTACK ELSE
//            }//:VSTACK
//        }//:ELSE
           
            
//                addButton()
        }//:SCROLLVIEW
            
        }//:VSTACKบนสุด
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
        
    }
}

struct ManualActivityList2_Previews: PreviewProvider {
    static var previews: some View {
        ManualActivityList2()
    }
}


struct fullsheetView: View {
    var closeAction: (() -> Void) = {}
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack {
                Text("I am a modal.")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                Button(action: {
                    self.closeAction()
                }, label: {
                    Text("OK, BYE!")
                        .foregroundColor(.white)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white, lineWidth: 1)
                    )
                })
            }
        }
    }
}
