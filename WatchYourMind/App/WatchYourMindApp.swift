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
//            ContentView2()
            
            SomethingAnalysisView()
                .environmentObject(somethingAnalysis())
            
        }
    }
}
