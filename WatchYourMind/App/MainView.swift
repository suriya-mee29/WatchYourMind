//
//  MainView.swift
//  WatchYourMind
//
//  Created by Gatang on 26/2/2564 BE.


import SwiftUI

//struct MainView: View {
//    @Binding var isAuthen : Bool
//    @State private var selection = 0
//    var body: some View {
////        ScrollView{
//
//
//    TabView(selection: $selection){
//            HomeContentView( isAuthen: $isAuthen, digit: .constant(10))
//                .tabItem {
//                    Image(systemName: "house")
//                    Text("HOME")
//                }.tag(0)
//
////        ZStack(alignment: .topTrailing) {
////
////
////
//            ManualActivityList()
//                        .tabItem {
//                            Image(systemName: "plus")
//                            Text("acc activity".uppercased())
//                        }.tag(1)
////
////
////
//       }//:TAB
//        .onAppear{
//            UITabBar.appearance().barTintColor = .white
//        }
////        .accentColor(Color.purple)
//////        Button(action : {
//////                selection = (selection + 1) % 2
//////            }) {
//////                Text("Done")
//////                    .font(.system(.headline, design: .rounded))
//////                    .padding()
//////                    .foregroundColor(.white)
//////                    .background(Color.purple)
//////                    .border(Color.white, width: 4)
//////                    .cornerRadius(10.0)
//////                    .padding()
//////
//////            }
////////        }//:ZSTACK
//
//
//}
//}

struct MainView : View {
    
//    @State var selectedTab = "Home"
        @State var selectedTab = "Home"

    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @Namespace var animation
    @StateObject var modelData = ModelView()
    @Binding var isAuthen : Bool
    
    var body: some View{
        
        VStack(spacing: 0){
            
//            GeometryReader{_ in
                
                ZStack{
                        HomeContentView(isAuthen: .constant(true), digit: .constant(10))
                        .opacity(selectedTab == "Home" ? 1 : 0)
                    
                            ManualActivityList()
                        .opacity(selectedTab == "Add Activity" ? 1 : 0)
                    
                }
            .onChange(of: selectedTab) { (_) in
                
                switch(selectedTab){
                
                case "Add Activity": if !modelData.isRestaurantLoad{modelData.loadRestaurant()}
                default: ()
                }
            }
            
            // TabView...
            
            HStack(spacing: 0){
                
                ForEach(tabs,id: \.self){tab in
                    
                    TabButton(title: tab, selectedTab: $selectedTab,animation: animation)
                    
                    if tab != tabs.last{
                        Spacer(minLength: 0)
//                            .padding(20)
                            .padding(.vertical,0.5)
                    }
                }
            }
            .padding(.horizontal,50)
            // for iphone like 8 and SE
//            .padding(.bottom,edges!.bottom == 0 ? 15 : edges!.bottom)
            .background(Color.white)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
    }
}

// Tab Button...

struct TabButton : View {
    
    var title : String
    @Binding var selectedTab : String
    var animation : Namespace.ID
    
    var body: some View{
        
        Button(action: {
            withAnimation{selectedTab = title}
        }) {
            
            VStack(spacing: 6){
                
                // Top Indicator....
                
                // Custom Shape...
                
                // Slide in and out animation...
                
                ZStack{
                    
                    CustomShape()
                        .fill(Color.clear)
                        .frame(width: UIScreen.Widthscreen/3, height: 6)
                    
                    if selectedTab == title{
                        
                        CustomShape()
                            .fill(Color("tint2"))
                            .frame(width: UIScreen.Widthscreen/3, height: 6)
                            .matchedGeometryEffect(id: "Tab_Change", in: animation)
                    }
                }
                .padding(.bottom,10)
                
                Image(title)
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(selectedTab == title ? Color("tint2") : Color.black.opacity(0.2))
                    .frame(width: 24, height: 24)
                
                Text(title)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black.opacity(selectedTab == title ? 0.6 : 0.2))
            }
        }
    }
}

// Custom Shape..

struct CustomShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 10, height: 10))
        
        return Path(path.cgPath)
    }
}

// Both Title Image Name Are Same....
var tabs = ["Home","Add Activity"]

// if You Having simply views and not that much network task means its fine
// else use this method to load data when the tab opens....

class ModelView : ObservableObject{
    
    @Published var isOrderLoad = false
    @Published var isRestaurantLoad = false
    @Published var isRewardLoad = false
    
    init() {
        
        // load initial data
        print("Home Data Loaded")
    }
    
    func loadOrders(){
        
        print("order Loaded")
        isOrderLoad = true
    }
    
    func loadRestaurant(){
        
        print("Restaurant Loaded")
        isRestaurantLoad = true
    }
    
    func loadReward(){
        
        print("reward Loaded")
        isRewardLoad = true
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(isAuthen: .constant(true))
            .environmentObject(Shop())
            .environmentObject(ManualList())
            .environmentObject(Measurement())
            .environmentObject(ListClientRequest())
            .environmentObject(Preact())
            .environmentObject(HomeView())
//            .environmentObject(reactivityList())
            .environmentObject(somethingAnalysis())
//            .environmentObject(ManualActivit())
        
        
        
    }
}
