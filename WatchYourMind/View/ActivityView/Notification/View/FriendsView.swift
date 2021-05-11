//
//  FriendView.swift
//  WatchYourMind
//
//  Created by Gatang on 3/5/2564 BE.
//

import SwiftUI
import BBRefreshableScrollView

class Preact: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: PreActivity? //= nil
}
struct FriendsView: View {
    var user: [userRequest] = userRequestData
    let feedback = UIImpactFeedbackGenerator(style: .heavy)
    @EnvironmentObject var preactivity: Preact
    @ObservedObject var clients = Client()


    var body: some View {

        ZStack{
            if preactivity.showingProduct == false{
                VStack{
            NavigationFriendRequest()
                    BBRefreshableScrollView { completion in
                        self.clients.fetchActivateClient { success, msg in
                            if success {
                                completion()
                            }
                        }
                    } content: {
                        VStack (alignment:.leading){
                            ForEach(self.clients.activateClient) { user in
                                         FriendRow(user :  user)
                         //                :HStack
                                         HStack{
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
                                            Spacer()
                                     }
                         //                Divider()
                                         }//:Loop
                        }
                        .padding(.horizontal)
                        
                    }

                    
          }//:VSTACK
  }//:IF

            else{
                PreActivity()
            }
        }//:ZStack
     
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {

        FriendsView(user:userRequestData) .environmentObject(ListClientRequest())
            .environmentObject(Preact())
    
    }
}


