//
//  ContentView.swift
//  WatchYourMind
//
//  Created by Suriya on 7/5/2564 BE.
//

import SwiftUI


struct ContentView2: View {
    @State var isAuthen : Bool
    
    init() {
        let userdefults = UserDefaults.standard
        if userdefults.bool(forKey: "USER_AUTHEN") != true || userdefults.bool(forKey: "USER_AUTHEN") != false  {
            let authen = userdefults.bool(forKey: "USER_AUTHEN" )
            isAuthen = authen
        }else{
            isAuthen = false
        }
        
        
        
    }
    var body: some View {
        if isAuthen{
            MainView(isAuthen: self.$isAuthen)
                .environmentObject(Shop())
                .environmentObject(Measurement())
                .environmentObject(ManualList())
                .environmentObject(ListClientRequest())
                .environmentObject(Preact())
        }else{
            LoginView(isAuthen: $isAuthen)
        }
    }
}

struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
