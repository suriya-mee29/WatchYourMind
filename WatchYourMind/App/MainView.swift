//
//  MainView.swift
//  WatchYourMind
//
//  Created by Gatang on 26/2/2564 BE.

import SwiftUI

struct MainView: View {
    
    var body: some View {
//        ScrollView{
         
        TabView{
              HomeContentView()
                .tabItem {
                    Image(systemName: "house")
//Image(systemName: "house.fill")
                
                  Text("HOME")
                }
                    PreActivity()
                        .tabItem {
                            Image(systemName: "person.badge.plus")
                            Text("NEW CLIENT")
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
        MainView()
            .environmentObject(Shop())
            .environmentObject(ManualList())
            .environmentObject(Measurement())
            .environmentObject(PostActivity())
            .environmentObject(ListClientRequest())
            .environmentObject(Preact())
        
    }
}
