//  ContentView.swift
//  WatchMyMind
//
//  Created by Gatang on 22/2/2564 BE.


import SwiftUI
class Shop: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: User? //= nil
}

class ListClientRequest: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: FriendsView? //= nil
}

class HomeView: ObservableObject {
  @Published var showingPage: Bool = false
  @Published var selectedPage: HomeContentView? //= nil
}
class HomeViewList: ObservableObject {
  @Published var showingPage: Bool = false
  @Published var selectedPage: HomeContentView? //= nil
}

class TableView: ObservableObject {
  @Published var showingPage: Bool = false
  @Published var selectedPage: TableListUser? //= nil
}

struct HomeContentView: View {
    //MARK:- PROPERTIES
    
//    @EnvironmentObject var homecontent: HomecontentView
    let colorBackground: Color = Color("bg-3")
    @State var selectedTag: String?
//    let feedback = UIImpactFeedbackGenerator(style: .heavy)
//    @EnvironmentObject var shop: Shop
    @State private var isAnimated: Bool = false
    @State private var searchText = ""
    
//    let colorBackground: Color = Color("bg-1")
    @State var isLinkActive = false
    @State var animals: [User] = Bundle.main.decode("users.json")
    @State var isNavigationBarHidden: Bool = true
    
    @State var datePicker : Date = Date()
    @State var isExpanded = false
    @State var statusSeed: [User] = Bundle.main.decode("StatusSeed.json")
    @State var isExpanded2 = false
    @State var statusSeeding: [User] = Bundle.main.decode("StatusSeeding.json")
    @State var isExpanded3 = false
    @State var statusSapling: [User] = Bundle.main.decode("StatusSapling.json")
    @State var isExpanded4 = false
    @State var statusTree: [User] = Bundle.main.decode("StatusTree.json")
    @State var isExpanded5 = false
    @State var statusBlooming: [User] = Bundle.main.decode("StatusBlooming.json")
    
    @State var isExpandedButtonBell = false
    let feedbackbell = UIImpactFeedbackGenerator(style: .heavy)
    @EnvironmentObject var clientRequest: ListClientRequest
    
    var psychologistManagement = PsychologistManagement()
    @Binding var isAuthen : Bool
    
    @State var showAlert : Bool = false
    @State var alertMessage : String = ""
    @State var headerMag : String = ""
    
    @State var labelNumber = 23
    @Binding var digit : Int

    let feedback = UIImpactFeedbackGenerator(style: .heavy)
    @EnvironmentObject var homeview: HomeView
    
    func numOfDigits() -> Float {
    let numOfDigits = Float(String(digit).count)
    return numOfDigits == 1 ? 1.5 : numOfDigits
    }
    

    
    //MARK:-BODY
    var body: some View {
       
        ZStack{
            if homeview.showingPage == false && clientRequest.showingProduct == false {
            VStack {
                VStack(spacing: 0){
                    HStack{
                        ZStack {
                           
                        Button(action: {
                        }, label: {
                            Image(systemName: "magnifyingglass")
                                .scaledToFit()
                                 .fixedSize()
                                .font(.system(size: 25))
                                 .foregroundColor(.black)
                                 
                                .frame(width: 20, height: 20)
                                .padding()
                                .background(Color.white)
                                .frame(width: 40, height: 40)
                                .cornerRadius(100)
                                .onTapGesture {
                                  feedback.impactOccurred()

                                    homeview.showingPage = true
//                                  }
                                }
                        }) //: BUTTON-SEARCH

                        }//:ZSTACK

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
                            
                           
                        Button(action: {
                        }, label: {
//                            Image(systemName: "person.badge.plus")
                            Image(systemName: "bell")
                                .font(.system(size: 26))
                                .scaledToFit()
                                 .fixedSize()
                                 .foregroundColor(.black)
                                 
                                .frame(width: 20, height: 20)
                                .padding()
                                .background(Color.white)
                                .frame(width: 40, height: 40)
                                .cornerRadius(100)
                                .onTapGesture {
                                  feedbackbell.impactOccurred()
                                clientRequest.showingProduct = true
                                }
                        }) //: BUTTON-BELL
                            ZStack {
                            
                                
                                Circle().fill(Color.red).frame(width: 25 * CGFloat(numOfDigits()), height:25, alignment: .topTrailing).position(CGPoint(x: 25, y: -5))
                                
                                Text("\(digit)")
                                .foregroundColor(Color.white)
                                .font(Font.system(size: 15).bold()).position(CGPoint(x: 25, y: -5))
                                    
                                
                          
                            }
                            .frame(width: 20, height: 20)
                        }//:ZSTACK
                        .padding(.trailing,10)
    //                    Spacer()
                        
                        .frame( height: 80)
                        
                        ZStack {
                           
                        Button(action: {
                            psychologistManagement.singOut { sucess, msg in
                                if sucess {
                                    self.isAuthen = false
                                }else{
                                    self.headerMag = "Fail to sing out"
                                    self.alertMessage = msg
                                    self.showAlert = true
                                }
                            }
                            
                        }, label: {
                            Image(systemName: "lock.open")
                                .scaledToFit()
                                 .fixedSize()
                                .font(.system(size: 26))
                                 .foregroundColor(.black)
                                 
                                .frame(width: 20, height: 20)
                                .padding()
                                .background(Color.white)
                                .frame(width: 40, height: 40)
                                .cornerRadius(100)

                        }) //: BUTTON-Sing Out

                        }//:ZSTACK
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
          
            }//:VSTACK
            }//:IF
            else if (homeview.showingPage == true){
                    
                    SearchView2()
                
            }
                else{
                    FriendsView()
                        
                }//:Else
        
        }//: ZStack
        .ignoresSafeArea(.all, edges: .top)
        .alert(isPresented: $showAlert , content: {
            Alert(title: Text(self.headerMag.uppercased()), message: Text("\(self.alertMessage)"), dismissButton: .default(Text("OK!")))
                    }
        )




        
}//:BODY
}//:ContentView




//MARK:-PREVIEW
struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView( isAuthen: .constant(true), digit: .constant(10))
            .environmentObject(Shop())
            .environmentObject(ListClientRequest())
            .environmentObject(Preact())
            .environmentObject(Measurement())
            .environmentObject(HomeView())
//            .environmentObject(TableView())
            .environmentObject(HomeViewList())
            .environmentObject(somethingAnalysis())
        }
    }

