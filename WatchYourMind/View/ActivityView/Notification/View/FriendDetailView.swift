//
//  FriendDetailView.swift
//  WatchYourMind
//
//  Created by Gatang on 3/5/2564 BE.
//

import SwiftUI

struct FriendDetailView: View {
    var friend:Friend
    var body: some View {
        VStack{
            Image(friend.poster)
                .resizable()
                .scaledToFit()
                .frame(height:500, alignment: .center)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding([.leading,.trailing])
//                .aspectRatio(contentMode: .fill)
            VStack{
                Image(friend.avatar)
                    .resizable()
                    .clipped()
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120, alignment: .center)
                Text(friend.name)
                    .fontWeight(.bold)
                    
            }//:VSTACK
            .offset(y: -70)
            Spacer()
        }//:VStack
        .navigationBarTitle(Text(friend.name),displayMode: .inline)
        
    }
}

struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView(friend: Friend(name: "Tawiporn Tadkaew", mutualFriend: 350, avatar: "image1", poster: "image1"))
    }
}
