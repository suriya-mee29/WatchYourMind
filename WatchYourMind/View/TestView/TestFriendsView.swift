//
//  TestFriendsView.swift
//  WatchYourMind
//
//  Created by Gatang on 23/5/2564 BE.
//

import SwiftUI

struct TestFriendsView: View {
    var body: some View {
        VStack{
        VStack {
            HStack {
                Circle()
                    .fill(Color.secondary)
                    .frame(width:80, height: 80)
                
                
                
                VStack(alignment: .leading,spacing:10){
                    VStack(alignment: .leading,spacing:2){
                        Text("user.student.data.displayname_en").redacted(reason: .placeholder)
                            .foregroundColor(.primary)
                        Text("user.student.data.displayname_th")
                            .redacted(reason: .placeholder)
                            .foregroundColor(.primary)
                        HStack{
                            Text ("(user.student.data.email)")
                                .redacted(reason: .placeholder)
                            .foregroundColor(.secondary)
                            Text("•")
                                .font(.system(size: 30))
                            .foregroundColor(.secondary)
                            Text ("(user.student.data.faculty)")
                                .redacted(reason: .placeholder)
                                .foregroundColor(.secondary)
                            Text("•")
                                .font(.system(size: 30))
                            .foregroundColor(.secondary)
                            Text ("(user.student.data.department)")
                                .redacted(reason: .placeholder)
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

    }
}

struct TestFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        TestFriendsView()
    }
}
