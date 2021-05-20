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
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
    
        WindowGroup {
//            DefineAfterView(iSSave: .constant(false))
//            SearchView2()
            ContentView2()
                .environmentObject(Shop())
                .environmentObject(Measurement())
                .environmentObject(ManualList())
                .environmentObject(ListClientRequest())
                .environmentObject(Preact())
                .environmentObject(HomeView())
                .environmentObject(HomeViewList())
                .environmentObject(somethingAnalysis())
        }
    }
}
