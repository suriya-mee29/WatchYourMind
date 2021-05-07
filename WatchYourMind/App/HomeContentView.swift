//
//  ContentView.swift
//  WatchMyMind
//
//  Created by Gatang on 22/2/2564 BE.
//

import SwiftUI
class Shop: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: Animal? //= nil
}
struct HomeContentView: View {
    //MARK:- PROPERTIES
    
    let colorBackground: Color = Color("bg-3")
    @State var selectedTag: String?
    let feedback = UIImpactFeedbackGenerator(style: .heavy)
    @EnvironmentObject var shop: Shop
    @State private var isAnimated: Bool = false

    @State private var searchText = ""
    
//    let colorBackground: Color = Color("bg-1")
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
    
    //MARK:-BODY
    var body: some View {
       
        ZStack{
        if shop.showingProduct == false  {
            VStack {
                VStack(spacing: 0){
                    HStack{

    //                    Spacer()

                        ZStack {
                           
                        Button(action: {
    //                            self.selectedTag = "xx"

                        }, label: {
                            Image(systemName: "magnifyingglass")
                                .scaledToFit()
                                
                
                                 .fixedSize()
                                 .foregroundColor(.black)
                                 
                                .frame(width: 20, height: 20)
                                .padding()
                                .background(Color.white)
                                .frame(width: 40, height: 40)
                                .cornerRadius(100)
                                .onTapGesture {
                                  feedback.impactOccurred()

                                    shop.showingProduct = true
//                                  }
                                }
    //                            .frame(width: UIScreen.screenWidth)
                                
                               
                        }) //: BUTTON-SEARCH

                        }//:ZSTACK
                        
    //                    }//: IF
                       
                        .padding(.leading)
                        Spacer()

                      
                        HStack{
                            Image("WatchMyMindNoBG")
                                

                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding()
                                .frame(width: 40, height: 40)
                                .background(Color.white)
                                .cornerRadius(8)

                                .onAppear(perform: {
                                  withAnimation(.easeOut(duration: 0.5)) {
                                    isAnimated.toggle()
                                  }
                                })

    //                    }
                        Text("watch my mind".uppercased())
                            .font(.system(size: 20, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
   
                        }

                        Spacer()

                            
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
    //                    }
                        .frame(width: 0, height: 0, alignment: .center)

                            
                        }
                        .padding(.trailing,50)
    //                    Spacer()
                        
                        .frame( height: 80)
                        
                    }//:HSTACK
                    .background(Color.purple)
                    .edgesIgnoringSafeArea(.all)
                    
                }
//                .padding(.horizontal, 15)
//                .padding(.bottom)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
//                .background(Color.purple)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
           
//                VStack(alignment: .leading, spacing: 0){
                    
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {

                        HStack(alignment:.center){
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
// TableListUser(animals: statusSeed)
                                    StatusListItemView(animals: statusSeed)


                                        .frame(width:400,height:250)
                                      
                                }
                               
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .shadow(radius: 10 )
//
                                
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
                                StatusListItemView(animals: statusSeed)

//                                    .frame(height:250)
                                    .frame(width:400,height:250)
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
                                StatusListItemView(animals: statusSeed)

                                    .frame(width:400,height:250)
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
                             
                                StatusListItemView(animals: statusSeed)

                                    .frame(width:400,height:250)
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
                             
                                StatusListItemView(animals: statusSeed)

                                    .frame(width:400,height:250)
                                    .cornerRadius(30)
                                    .shadow(radius: 10)
                                
                            }
                            
                        }
                        
                        .animation(.spring())

                        
                    }//: HStack
                        .padding(.horizontal)
        //                })//:LazyHGrid
        //                .frame(height: 650, alignment: .center)
                    .padding()
                       
                    })

                VStack{
                    HStack{
                        Text(Calendar.current.isDateInToday(datePicker) ? "Today:" : "Day")
                            .font(.system(size: 30))
                            .font(.title)
                            .fontWeight(.heavy)
                        //                    ButtonCalendar()
                        CalendarPicker(datePicker: $datePicker)
                            .accentColor(.purple)
                        Spacer()

                        
                    }
                
                    
                    .padding(.horizontal,2)
                    .padding(.vertical)
                    TableListUser(animals: self.animals)
                }
                        .onChange(of: datePicker, perform: { value in

                            self.animals = Bundle.main.decode("otherDate.json")

                        })
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 10 )

                        .padding()

                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
          
            }
                }else{
                    
                    SearchView2()
                        
                }//:Else
            
        
        }//: ZStack
        .ignoresSafeArea(.all, edges: .top)




        
}//:BODY
}//:ContentView




//MARK:-PREVIEW
struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
            HomeContentView()
                .environmentObject(Shop())
        }
    }

