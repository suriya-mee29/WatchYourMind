//
//  MainView.swift
//  WatchYourMind
//
//  Created by Gatang on 26/2/2564 BE.

import SwiftUI

struct MainView: View {
    @Binding var isAuthen : Bool
     var assignmentVM = AssignmentViewModel()
    
    var body: some View {
//        ScrollView{
         
        TabView{
            HomeContentView( isAuthen: $isAuthen)
              
                .tabItem {
                    Image(systemName: "house")

                
                  Text("HOME")
                }
            ManualActivityList(preActivityModel: PreActivityModel(presentation: "", precipitance: [String:[String:Bool]](), pattern: "", faultyThinking: "", intensityLevel: 43.2, emotionLevel: "", event: "", stateProblem: 2), client: UserModel(timestamp: 1, status: true, message: "ok", data: DataUserModel(type: "std", statusid: "11", statusname: "dddd", userName: "dddd", prefixname: "ddd", displayname_th: "dddd", displayname_en: "ddd", email: "dddd", department: "ddd", faculty: "dddd")))
                        .tabItem {
                            Image(systemName: "plus")
                            Text("acc activity".uppercased())
                        }
            
    }//:TAB
       
        .onAppear{
            UITabBar.appearance().barTintColor = .white
            UITabBar.appearance().backgroundColor = .red
        }
        .accentColor(Color.purple)
}
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(isAuthen: .constant(true))
            .environmentObject(Shop())
            .environmentObject(ManualList())
            .environmentObject(Measurement())
            .environmentObject(PostActivity())
            .environmentObject(ListClientRequest())
            .environmentObject(Preact())
        
    }
}
