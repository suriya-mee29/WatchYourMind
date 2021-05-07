//
//  HeaderView.swift
//  WatchYourMind
//
//  Created by Gatang on 23/4/2564 BE.
//

import SwiftUI

struct HeaderView: View {
    let title: LocalizedStringKey
      let subtitle: LocalizedStringKey
      var bgColor: Color
    let colorBackground: Color = Color("bg-1")
    @State var isLinkActive = false
    @State var animals: [Animal] = Bundle.main.decode("animals.json")
    @State var isNavigationBarHidden: Bool = true
    
    @State var datePicker : Date = Date()
    @State var isExpanded = false
    @State var statusSeed: [Animal] = Bundle.main.decode("StatusSeed.json")
    @State var isExpanded2 = false
    @State var statusSeeding: [Animal] = Bundle.main.decode("StatusSeeding.json")
    @State var isExpanded3 = false
    @State var statusSapling: [Animal] = Bundle.main.decode("StatusSapling.json")
    @State var isExpanded4 = false
    @State var statusTree: [Animal] = Bundle.main.decode("StatusTree.json")
    @State var isExpanded5 = false
    @State var statusBlooming: [Animal] = Bundle.main.decode("StatusBlooming.json")
    @State var show = false

      var body: some View {
        VStack{
          GeometryReader { geometry in
//              ZStack {
                  Rectangle()
                    
                    .fill(Color.purple)
                    .cornerRadius(20.0)
                    .frame(width: geometry.size.width * 1.0, height: geometry.size.height * 0.3)
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.0)
                   
                  .shadow(radius: 3)
                  .edgesIgnoringSafeArea(.all)
            
            HStack{
            Text("watch my mine".uppercased())
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(Color.white)
                .padding(.leading)
                Spacer(minLength: 0)
//                Button(action: {
                    
//                    withAnimation {
//
//                        self.show.toggle()
//                    }
//
//                }) {
//                    NavigationLink(destination: Text("OtherView"), isActive: $isLinkActive) {
//                    Spacer(minLength: 0)

                    
                        Button(action: {}, label: {
                       
                            ZStack{
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(100)
                    Image("search").foregroundColor(.black)
                        .padding(10)
                           
                            }//:ZStack
                        }) //: BUTTON-BELL
                    
                    Button(action: {}, label: {
                   
                        ZStack{
                            Circle()
                                .fill(Color.white)
                                .frame(width: 40, height: 40)
                                .cornerRadius(100)
                Image(systemName: "bell")
                    .font(.system(size: 20))

                    .font(.largeTitle)
                    .font(.system(size: 1))
                    .foregroundColor(.black)
                    
                    .padding(10)
                       
                        }//:ZStack
                    }) //: BUTTON-BELL
                    
                  
//                    }
                    
//                }//:NavigationLink
//            SearchView()
//                .padding(.top,30)
            }
            //              }
            
           
          }
        VStack{
            ScrollView(.horizontal, showsIndicators: false, content: {
                
                
                HStack{
                    VStack {
                        Button(action: {
                            print("Expandable button tapped!!!")
                            isExpanded.toggle()
                            
                        }) {
                            StatusView(statusTitle: "Seed".uppercased(), iconName: "seed", statusLabel: "Client have seed", count_status: "21",bg_image: "seedColor")
                                
                                .cornerRadius(10)
                                .shadow(radius: 10)
                            
                            
                        }
                        
                        if isExpanded {
                            ZStack{
                                TableListUser(animals: statusSeed)
                                    .frame( height: 300, alignment: .center)
                                    
                                    .cornerRadius(30)
                                    .shadow(radius: 10)
                            }
                            
                            
                        }
                        
                        
                        
                    }
                    
                    
                    .animation(.spring())
                    //:1
                    VStack {
                        Button(action: {
                            print("Expandable button tapped!!!")
                            isExpanded2.toggle()
                            
                        }) {
                            StatusView(statusTitle: "Seeding".uppercased(), iconName: "seeding", statusLabel: "Client have seeding", count_status: "13",bg_image: "seedingColor")
                                .cornerRadius(10)
                                .shadow(radius: 10)
                        }
                        if isExpanded2 {
                            TableListUser(animals: statusSeeding)
                                .cornerRadius(30)
                                .shadow(radius: 10)
                        }
                        
                    }
                    
                    .animation(.spring())
                    VStack {
                        
                        
                        
                        Button(action: {
                            print("Expandable button tapped!!!")
                            isExpanded3.toggle()
                            
                        }) {
                            StatusView(statusTitle: "Sapling".uppercased(), iconName: "sapling", statusLabel: "Client have sapling", count_status: "8",bg_image: "saplingColor")
                                .cornerRadius(10)
                                .shadow(radius: 10)
                        }
                        if isExpanded3 {
                            TableListUser(animals: statusSapling)
                                .cornerRadius(30)
                                .shadow(radius: 10)
                        }
                        
                    }
                    
                    .animation(.spring())
                    VStack {
                        
                        
                        
                        Button(action: {
                            print("Expandable button tapped!!!")
                            isExpanded4.toggle()
                            
                        }) {
                            
                            StatusView(statusTitle: "Tree".uppercased(), iconName: "Tree", statusLabel: "Client have\n tree", count_status: "8",bg_image: "treeColor")
                                .cornerRadius(10)
                                .shadow(radius: 10)                               }
                        if isExpanded4 {
                            
                            TableListUser(animals: statusTree)
                                .cornerRadius(30)
                                .shadow(radius: 10)
                            
                        }
                        
                    }
                    
                    .animation(.spring())
                    
                    VStack {
                        
                        
                        
                        Button(action: {
                            print("Expandable button tapped!!!")
                            isExpanded5.toggle()
                            
                        }) {
                            
                            StatusView(statusTitle: "Blooming".uppercased(), iconName: "Blooming", statusLabel: "Client have blooming", count_status: "8",bg_image: "bloomingColor")
                                .cornerRadius(10)
                                .shadow(radius: 10)                                }
                        if isExpanded5 {
                            
                            TableListUser(animals: statusBlooming)
                                .cornerRadius(30)
                                .shadow(radius: 10)
                            
                        }
                        
                    }
                    
                    .animation(.spring())
                    
                    
                }//: HStack
                //                        .position(x: (UIScreen.Widthscreen/2)+330, y: UIScreen.Height)
                //                        .padding(.top,100)
                //                })//:LazyHGrid
                //                .frame(height: 650, alignment: .center)
//                .padding(.vertical,100)
//                .padding(.horizontal)
                .padding()
                .edgesIgnoringSafeArea(.top)
                
            })
        }
        }
//          .frame(width: UIScreen.Widthscreen, height: UIScreen.Heightscreen, alignment: .center)
      }
  }
  struct HeaderView_Previews: PreviewProvider {
      static var previews: some View {
        HeaderView(title: "Groups", subtitle: "Choose a group to connect", bgColor: Color.purple)
      }
  }
