//
//  WatchMyMindApp.swift
//  WatchMyMind
//
//  Created by Gatang on 22/2/2564 BE.
//

import SwiftUI



@main
struct WatchYourMindApp: App {
//    @StateObject private var order = Order()
    static let animals: [Animal] = Bundle.main.decode("animals.json")

    var body: some Scene {
        
        
        
        WindowGroup {
      MainView()
//            TableListUser(animals: WatchYourMindApp.animals)
//                .modifier(SystemServices())

                .environmentObject(Shop())
                .environmentObject(Measurement())
                .environmentObject(ManualList())
                .environmentObject(PostActivity())
        }
    }
}
