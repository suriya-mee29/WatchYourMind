//
//  FriendRow.swift
//  WatchYourMind
//
//  Created by Gatang on 3/5/2564 BE.
//
import SwiftUI

struct FriendRow: View {
    var user: userRequest
    
    var body: some View {
        VStack{

        VStack {
            HStack {
                Image("\(user.imageUser)")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .clipped()

                    .clipShape(Circle())
                    
                    .frame(width:80, height: 80)
                
                
                
                VStack(alignment: .leading,spacing:10){
                    VStack(alignment: .leading,spacing:2){
                        Text(user.nameEN)
                            .foregroundColor(.primary)
                        Text(user.nameTH)
                            .foregroundColor(.primary)
                        HStack{
                            Text ("\(user.email)")
                            .foregroundColor(.secondary)
                            Text("•")
                                .font(.system(size: 30))
                            .foregroundColor(.secondary)
                            Text ("\(user.faculty)")
                                .foregroundColor(.secondary)
                            Text("•")
                                .font(.system(size: 30))
                            .foregroundColor(.secondary)
                            Text ("\(user.branch)")
                                .foregroundColor(.secondary)
                        
                        }//:HSTACK

                    }//:VStack(alignment: .leading,spacing:10)
                    
                }//:VStack
         Spacer()

                    .frame(width: 100, height: 100, alignment: .center)

                    .padding(.trailing,20)

            }//:HStack

        }//:VSTACK

        }
//        }//:NavigationLink
    }
}

struct FriendRow_Previews: PreviewProvider {
    static var previews: some View {
        FriendRow(user: userRequestData[1])

    }
}
