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
    
    var friends: [Friend] = [
        Friend(name: "Tawiporn Tadkaew", mutualFriend: 350, avatar: "image1", poster: "image1"),
        Friend(name: "Siriporn Tadkaew", mutualFriend: 30, avatar: "image2", poster: "image2"),
        Friend(name: "Thanakit Tadkaew", mutualFriend: 35, avatar: "image3", poster: "image3"),
        Friend(name: "Peerawit Tadkaew", mutualFriend: 50, avatar: "image4", poster: "image4")
    ]
    var body: some View {
        NavigationView{
            ScrollView {
            ForEach(friends, id:\.id) { friends in
                FriendRow(friend :  friends).padding()
                //:HStack
                
                }//:Loop
            .navigationBarTitle("Friends")
            }//:ScrollView
            
        }
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}


