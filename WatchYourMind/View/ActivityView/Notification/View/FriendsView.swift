//
//  FriendView.swift
//  WatchYourMind
//
//  Created by Gatang on 3/5/2564 BE.
//

import SwiftUI

struct Friend: Identifiable {
    var id:UUID = UUID()
    var name: String
    var mutualFriend: Int//มีเพื่อนร่วม
    var avatar: String
    var poster: String

}

struct FriendsView: View {
    var user: [userRequest] = userRequestData
  

    var body: some View {
//        NavigationView{
    
        ScrollView(.vertical, showsIndicators: false) {
                NavigationFriendRequest()
            VStack(alignment: .leading){
            ForEach(user, id:\.id) { user in
                FriendRow(user :  user)
                //:HStack
                }//:Loop
            .navigationBarTitle("Friends")
            }//:VSTACK
            
        }//:ScrollView
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView(user:userRequestData) .environmentObject(ListClientRequest())
    
    }
}


