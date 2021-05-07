//
//  ClientRequest.swift
//  WatchYourMind
//
//  Created by Gatang on 3/5/2564 BE.
//

import SwiftUI

struct ClientRequest: View {
    @State var activeTab:Int = 2
    var body: some View {
        TabView(selection: $activeTab) {
            Text("Feed").tabItem { Image(systemName: "list.bullet") }.tag(1)
            FriendsView().tabItem { Image(systemName: "person.2.fill") }.tag(2)
            Text("Groups").tabItem { Image(systemName: "person.3.fill") }.tag(3)
            Text("Settings").tabItem { Image(systemName: "gear") }.tag(4)
        }
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ClientRequest_Previews: PreviewProvider {
    static var previews: some View {
        ClientRequest()
    }
}
