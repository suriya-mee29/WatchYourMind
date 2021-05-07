//
//  ExpandableButton.swift
//  WatchYourMind
//
//  Created by Gatang on 20/4/2564 BE.
//

import SwiftUI

struct ExpandableButton: View {
    
    @State var isExpanded = false
    @State var isExpanded2 = false
    @State var isExpanded3 = false
    @State var isExpanded4 = false
    @State private var gridcolum : Int = 2
    let columnSpacing: CGFloat = 10
    let animals : [Animal]

    
    var body: some View {
        
//        ZStack {
            ScrollView(.horizontal, showsIndicators: false, content: {

            HStack{
                VStack {
                    Button(action: {
                        print("Expandable button tapped!!!")
                        isExpanded.toggle()
                        
                    }) {
                        StatusView(statusTitle: "Tree".uppercased(), iconName: "Tree", statusLabel: "Client have \n tree", count_status: "8",bg_image: "treeColor")
                            
                            .cornerRadius(30)
                            .shadow(radius: 10)
                    }
                    
                    if isExpanded {
                        ZStack{
                        TableListUser(animals: animals)
                            
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
                        StatusView(statusTitle: "Tree".uppercased(), iconName: "Tree", statusLabel: "Client have \n tree", count_status: "8",bg_image: "treeColor")
                            .cornerRadius(30)
                            .shadow(radius: 10)
                    }
                    if isExpanded2 {
                        TableListUser(animals: [])
                            .cornerRadius(30)
                            .shadow(radius: 30)
                    }
                    
                }
                
                .animation(.spring())
                VStack {
                   
                    
                
                    Button(action: {
                        print("Expandable button tapped!!!")
                        isExpanded3.toggle()
                        
                    }) {
                        StatusView(statusTitle: "Tree".uppercased(), iconName: "Tree", statusLabel: "Client have \n tree", count_status: "8",bg_image: "treeColor")
                            .cornerRadius(30)
                            .shadow(radius: 10)
                    }
                    if isExpanded3 {
                        TableListUser(animals: [])
                            .cornerRadius(30)
                            .shadow(radius: 30)
                    }
                    
                }
                
                .animation(.spring())
                VStack {
                   
                    
                
                    Button(action: {
                        print("Expandable button tapped!!!")
                        isExpanded4.toggle()
                        
                    }) {
                        StatusView(statusTitle: "Tree".uppercased(), iconName: "Tree", statusLabel: "Client have \n tree", count_status: "8",bg_image: "treeColor")
                            .cornerRadius(30)
                            .shadow(radius: 10)
                    }
                    if isExpanded4 {
                     
                        TableListUser(animals: [])
                            .cornerRadius(30)
                            .shadow(radius: 30)
                        
                    }
                    
                }
                
                .animation(.spring())

                
            }//: HStack
//                })//:LazyHGrid
//                .frame(height: 650, alignment: .center)
            .padding()
               
            })
//        }
//        .frame(height:300)
    }
}

struct ExpandableButton_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("otherDate.json")
    static var previews: some View {
        ExpandableButton(animals: animals)
    }
}
