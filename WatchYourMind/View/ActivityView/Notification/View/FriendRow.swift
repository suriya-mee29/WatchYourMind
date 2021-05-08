//
//  FriendRow.swift
//  WatchYourMind
//
//  Created by Gatang on 3/5/2564 BE.
//
import SwiftUI

class Preact: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: PreActivity? //= nil
}

struct FriendRow: View {
    var user: userRequest
    let feedback = UIImpactFeedbackGenerator(style: .heavy)
    @EnvironmentObject var preactivity: Preact
    
    var body: some View {
        if preactivity.showingProduct == false{
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
                
    //            VStack{
                                    Spacer()

                    Button(action: {
                        print("Add Friend")
                    },label : {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(height:35)
                                .accentColor(.purple)
                            Text("Confirm")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                               
                        }
                        .onTapGesture {
                          feedback.impactOccurred()
                        preactivity.showingProduct = true
                        }
                    })
                    .frame(width: 100, height: 100, alignment: .center)
//                    .padding(.bottom,60)
                    .padding(.trailing,20)
                    
                    
                    

    //            }//:HStack


            }//:HStack
            Divider()

        }//:VSTACK
        }//:IF
        else{
            PreActivity()
        }

//        }//:NavigationLink
    }
}

struct FriendRow_Previews: PreviewProvider {
    static var previews: some View {
        FriendRow(user: userRequestData[1])
            .environmentObject(Preact())
    }
}
