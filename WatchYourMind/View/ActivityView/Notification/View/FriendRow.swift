//
//  FriendRow.swift
//  WatchYourMind
//
//  Created by Gatang on 3/5/2564 BE.
//

import SwiftUI

struct FriendRow: View {
    var friend: Friend
    var body: some View {
        NavigationLink(
            destination: FriendDetailView(friend: friend)) {
            
        HStack {
            Image(friend.avatar)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .clipped()

                .clipShape(Circle())
                
                .frame(width:80, height: 80)
            
            
            
            VStack(alignment: .leading,spacing:10){
                VStack(alignment: .leading,spacing:2){
                    Text(friend.name)
                        .foregroundColor(.primary)
                    Text("\(friend.mutualFriend) mutual friends")
                        .foregroundColor(.secondary)
                }//:VStack(alignment: .leading,spacing:10)
                HStack{
                    Button(action: {
                        print("Add Friend")
                    }){
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(height:35)
                                .accentColor(.blue)
                            Text("Add Friend ")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                        }
                    }
                    
                    Button(action: {
                        print("Add Friend")
                    }){
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(height:35)
                                .accentColor(.gray)
                            Text("Remove")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                }//:HStack
            }//:VStack
        }//:HStack
        }//:NavigationLink
    }
}

struct FriendRow_Previews: PreviewProvider {
    static var previews: some View {
        FriendRow(friend: Friend(name: "Tawiporn Tadkaew", mutualFriend: 350, avatar: "image1", poster: "image1"))
    }
}
