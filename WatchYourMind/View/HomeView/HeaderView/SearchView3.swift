//
//  SearchView3.swift
//  WatchYourMind
//
//  Created by Gatang on 26/3/2564 BE.
//

import SwiftUI

struct Home : View {
    
    @State var show = false
    @State var txt = ""
    @State var isLinkActive = false
    
    var body : some View{
        
//        VStack(spacing: 0){
            

            
            HStack(alignment: .center){
                
                
//                if !self.show{
                    
                    Text("watch my mine".uppercased())
//                        .font(.system(size: 40))
                        .font(.system(size: 40, design: .rounded))
                        .fontWeight(.bold)
//                        .font(.title)
                        .foregroundColor(Color.white)
                        .padding()
//                        .foregroundColor(Color.purple)
//                }
//                Spacer(minLength: 0)
                
                HStack {
//                    HStack{
                        
//                        if self.show{
                            
                            
                    ZStack {
                        Button(action: {}, label: {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding()
                                .background(Color.white)
                                .frame(width: 40, height: 40)
                                .cornerRadius(100)

                                .fixedSize()
                                .foregroundColor(.black)
                        }) //: BUTTON-BELL
                        
                       
                    }
                            
//                            TextField("Search username or userID", text: self.$txt)
//
//                            Button(action: {
//
//                                withAnimation {
//
//                                    self.txt = ""
//                                    self.show.toggle()
//                                }
//
//                            }) {
//
//                                Image(systemName: "xmark").foregroundColor(.black)
//                            }
//                            .padding(.horizontal, 5)
//
                            
                            
//                        }
                        
//                        else{
//
//                            Button(action: {
//
//                                withAnimation {
//
//                                    self.show.toggle()
//                                }
//
//                            }) {
////                                NavigationLink(destination: Text("OtherView"), isActive: $isLinkActive) {
//                                Image("search").foregroundColor(.black).padding(10)
////                                }
//
//                            }
//
//                        }
                        
//                    }
//                    .padding()
////                    .padding(self.show ? 5 : 0)
//                    .background(Color.white)
//                    .cornerRadius(30)
//
                    ZStack {
                        Button(action: {}, label: {
                            Image(systemName: "bell")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding()
                                .background(Color.white)
                                .frame(width: 40, height: 40)
                                .cornerRadius(100)

                                .fixedSize()
                                .foregroundColor(.black)
                        }) //: BUTTON-BELL
                        
                       
                    }
                  
//                    .padding()
                   

               

//                    .padding(.leading,50)
                    
//                    .frame(width: 0, height: 0, alignment: .center)
                    

//                }
                
                
            }
//                .frame(width:500,height: 100)
            .padding(.top)
            .padding(.horizontal)
            .padding(.bottom, 10)
            
//            .background(Color.purple)
            
            

            
               
        }
            .frame(width: UIScreen.Width, height: 300, alignment: .center)
        .background(Color.purple)
//        .background(Color(.tertiarySystemFill))
        .edgesIgnoringSafeArea(.all)
            .cornerRadius(30)

//            Spacer()
        
//        }
    
        
    }
}



class Host: UIHostingController<SearchView3> {
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
}



struct SearchView3: View {
    var body: some View {
        Home()
    }
}

struct SearchView3_Previews: PreviewProvider {
    static var previews: some View {
        SearchView3()
    }
}
