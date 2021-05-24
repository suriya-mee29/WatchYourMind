//
//  MainView.swift
//  WatchYourMind
//
//  Created by Gatang on 26/2/2564 BE.

import SwiftUI

struct MainView : View {
    @State var selectedTab = "Home"

    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @Namespace var animation
    @StateObject var modelData = ModelView()
    @Binding var isAuthen : Bool
    
    @EnvironmentObject var shop :Shop
    @EnvironmentObject var ManualList : ManualList
    @EnvironmentObject var measurement : Measurement
    @EnvironmentObject var listClientRequest : ListClientRequest
    @EnvironmentObject var preact : Preact
    @EnvironmentObject var somethingAnalysis : somethingAnalysis
    
    
    
    var body: some View{
        
        VStack(spacing: 0){
                
                ZStack{
                    HomeContentView(isAuthen: .constant(true))
                        .opacity(selectedTab == "Home" ? 1 : 0)
                        .environmentObject(self.shop)
                        .environmentObject(self.ManualList)
                        .environmentObject(self.measurement)
                        .environmentObject(self.listClientRequest)
                        .environmentObject(self.preact)
                        .environmentObject(self.somethingAnalysis)
                    
                    ManualActivityList(preActivityModel: PreActivityModel(presentation: "", precipitance: [String:[String:Bool]](), pattern: "", faultyThinking: "", intensityLevel: 43.2, emotionLevel: "", event: "", stateProblem: 2), client: UserModel(timestamp: 1, status: true, message: "ok", data: DataUserModel(type: "std", statusid: "11", statusname: "dddd", userName: "dddd", prefixname: "ddd", displayname_th: "dddd", displayname_en: "ddd", email: "dddd", department: "ddd", faculty: "dddd")), isCreateActivity: true)
                        .opacity(selectedTab == "Add Activity2" ? 1 : 0)
                    
                }
            .onChange(of: selectedTab) { (_) in
                
                switch(selectedTab){
                
                case "Add Activity": if !modelData.isRestaurantLoad{modelData.loadRestaurant()}
                default: ()
                }
            }// TabView...
            
            HStack(spacing: 0){
                
                ForEach(tabs,id: \.self){tab in
                    
                    TabButton(title: tab, selectedTab: $selectedTab,animation: animation)
                    
                    if tab != tabs.last{
                        Spacer(minLength: 0)
                            .padding(.vertical,0.5)
                    }
                }
            }
            .padding(.horizontal,50)

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
                    .frame(width: 27, height: 27)
                
                Text(title)
                    .font(.system(size: 18))
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor((selectedTab == title ? Color("tint2") : Color.black.opacity(0.2)))
//                    .opacity(selectedTab == title ? 0.6 : 0.2)
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

var tabs = ["Home","Add Activity2"]


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
        
//            .environmentObject(HomeView())
//
            .environmentObject(somethingAnalysis())
        
    }
}
