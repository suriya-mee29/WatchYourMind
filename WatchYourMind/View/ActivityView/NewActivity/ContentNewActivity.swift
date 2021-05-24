//
//  ContentNewActivity.swift
//  WatchYourMind
//
//  Created by Gatang on 31/3/2564 BE.
//

import SwiftUI

struct ContentNewActivity: View {
    @State var showSheetView = false
    @State private var isIphone : Bool = true
    

        var body: some View {
//            NavigationView {
                
                ScrollView(.vertical, showsIndicators: false) {
                    if !isIphone{
                            HStack (alignment: .top){
//                            AutoActivityList()
                                ManualActivityList(preActivityModel: PreActivityModel(presentation: "", precipitance: [String:[String:Bool]](), pattern: "", faultyThinking: "", intensityLevel: 43.2, emotionLevel: "", event: "", stateProblem: 2), client: UserModel(timestamp: 1, status: true, message: "ok", data: DataUserModel(type: "std", statusid: "11", statusname: "dddd", userName: "dddd", prefixname: "ddd", displayname_th: "dddd", displayname_en: "ddd", email: "dddd", department: "ddd", faculty: "dddd")), isCreateActivity: false)
                                
                            }
                       
                        }
                    else{
                        VStack {
//                            AutoActivityList()
                            
                            ManualActivityList(preActivityModel: PreActivityModel(presentation: "", precipitance: [String:[String:Bool]](), pattern: "", faultyThinking: "", intensityLevel: 43.2, emotionLevel: "", event: "", stateProblem: 2), client: UserModel(timestamp: 1, status: true, message: "ok", data: DataUserModel(type: "std", statusid: "11", statusname: "dddd", userName: "dddd", prefixname: "ddd", displayname_th: "dddd", displayname_en: "ddd", email: "dddd", department: "ddd", faculty: "dddd")), isCreateActivity: false)
                        }
//                        buttonPreActivity()

                    }
                    
                    buttonPreActivity()
                     
            }//:ScrollView
                        .onAppear(perform: {
                            if UIDevice.current.userInterfaceIdiom == .phone{
                               isIphone = true
                            }else{
                                isIphone = false
                            }
                        })//:onAppear
                    .navigationBarTitle("ActivityListView", displayMode: .inline)                .navigationBarTitle("Activity List")

          
    .sheet(isPresented: $showSheetView) {
                SheetView2(showSheetView: self.$showSheetView)
            }
//            }//:Navigation
            
        }
}


struct SheetView2: View {
    @Binding var showSheetView: Bool

        var body: some View {
            NavigationView {
                NewActivityView(iSSave: .constant(false), activityData: .constant(ManualActivityModel(id: "", createby: "", title: "", description: "", createDate: Date(), type: "", imageicon: "", link: "", pic: "", outcome:[])), showSheetView: .constant(true))
                    .navigationBarTitle(Text("New Activity"), displayMode: .inline)
                

            }
        }
}

struct ContentNewActivity_Previews: PreviewProvider {
    static var previews: some View {
        ContentNewActivity()
    }
}
