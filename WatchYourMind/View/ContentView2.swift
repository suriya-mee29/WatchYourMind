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
            print("nil in contentView2")
        }else{
            isAuthen = false
        }
        
        
        
    }
    var body: some View {
        if isAuthen{
        MainView()
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
