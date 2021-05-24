//
//  FriendView.swift
//  WatchYourMind
//
//  Created by Gatang on 3/5/2564 BE.

import SwiftUI
import BBRefreshableScrollView

class Preact: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: PreActivity? //= nil
}
struct FriendsView: View {
    @EnvironmentObject var shop :Shop
    @EnvironmentObject var ManualList : ManualList
    @EnvironmentObject var measurement : Measurement
    @EnvironmentObject var listClientRequest : ListClientRequest
    @EnvironmentObject var preact : Preact
    var user: [userRequest] = userRequestData
    let feedback = UIImpactFeedbackGenerator(style: .heavy)
    @ObservedObject var clients = Client()
    @State var selectedClient : UserModel?
    @State var clientNumber : Int = 1


    var body: some View {

        ZStack{
            if preact.showingProduct == false{
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
                            if self.clients.activateClient.count == 0 {
                                
                                if self.clientNumber > 0{
                                    var testArr = [1,2,3,4]
                                    ForEach(testArr,id :\.self){ data in
                                        TestFriendsView().padding()
                                      
                                          
                                       
                                    }
                                    
                                }else{
                                    Text("Doesn't have new clients...")
                                }
                                
                               
                                    
                            }else{
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
                                                self.selectedClient = user.student
                                               feedback.impactOccurred()
                                             preact.showingProduct = true
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
                        }
                        .padding(.horizontal)
                        
                    }

                    
          }//:VSTACK
  }//:IF

            else{
                if let client = self.selectedClient {
                PreActivity(client: client)
                    .environmentObject(self.shop)
                    .environmentObject(self.ManualList)
                    .environmentObject(self.measurement)
                    .environmentObject(self.listClientRequest)
                    .environmentObject(self.preact)
                }
            }
        }//:ZStack
     
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {

        FriendsView(user:userRequestData)
            .environmentObject(Shop())
            .environmentObject(ManualList())
            .environmentObject(Measurement())
            .environmentObject(ListClientRequest())
            .environmentObject(Preact())
    
    }
}


