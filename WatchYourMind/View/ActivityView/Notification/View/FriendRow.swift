//
//  FriendRow.swift
//  WatchYourMind
//
//  Created by Gatang on 3/5/2564 BE.
//
import SwiftUI

struct FriendRow: View {
    var user: ClientModel
    
    var body: some View {
        VStack{

        VStack {
            HStack {
                Image("Avatar_white")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .clipped()

                    .clipShape(Circle())
                    
                    .frame(width:80, height: 80)
                
                
                
                VStack(alignment: .leading,spacing:10){
                    VStack(alignment: .leading,spacing:2){
                        Text(user.student.data.displayname_en)
                            .foregroundColor(.primary)
                        Text(user.student.data.displayname_th)
                            .foregroundColor(.primary)
                        HStack{
                            Text ("\(user.student.data.email)")
                            .foregroundColor(.secondary)
                            Text("•")
                                .font(.system(size: 30))
                            .foregroundColor(.secondary)
                            Text ("\(user.student.data.faculty)")
                                .foregroundColor(.secondary)
                            Text("•")
                                .font(.system(size: 30))
                            .foregroundColor(.secondary)
                            Text ("\(user.student.data.department)")
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
        FriendRow(user: ClientModel(id: UUID(), student: UserModel(timestamp: 1, status: true, message: "ok", data: DataUserModel(type: "std", statusid: "11", statusname: "dddd", userName: "dddd", prefixname: "ddd", displayname_th: "dddd", displayname_en: "ddd", email: "dddd", department: "ddd", faculty: "dddd"))))

    }
}
