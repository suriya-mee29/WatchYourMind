//
//  WatchMyMindApp.swift
//  WatchMyMind
//
//  Created by Gatang on 22/2/2564 BE.
//

import SwiftUI
import Firebase


@main
struct WatchYourMindApp: App {
//    @StateObject private var order = Order()
//    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    init() {
        FirebaseApp.configure()
        
        
       
    }

    var body: some Scene {
        
        
        
        WindowGroup {
//            ContentView2()
//                .environmentObject(Shop())
//                .environmentObject(Measurement())
//                .environmentObject(ManualList())
//                .environmentObject(PostActivity())
//                .environmentObject(ListClientRequest())
//                .environmentObject(Preact())
            NotificationSend()
        }
    }
}
