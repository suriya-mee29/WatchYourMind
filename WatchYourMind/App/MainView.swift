//
//  MainView.swift
//  WatchYourMind
//
//  Created by Gatang on 26/2/2564 BE.

import SwiftUI

struct MainView: View {
    @Binding var isAuthen : Bool
    
    var body: some View {
//        ScrollView{
         
        TabView{
            HomeContentView( isAuthen: $isAuthen)
                .tabItem {
                    Image(systemName: "house")
//Image(systemName: "house.fill")
                
                  Text("HOME")
                }
                    ManualActivityList()
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
