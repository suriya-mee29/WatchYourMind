//
//  ContentTabsView.swift
//  WatchYourMind
//
//  Created by Gatang on 16/3/2564 BE.
//

import SwiftUI

struct ContentTabsView: View {
        @State private var selectedTab: Int = 0
    @State private var totalHeight = CGFloat(100) // no matter - just for static Preview !!


           let tabs: [Tab] = [
               .init(icon: Image(systemName: "photo"), title: "Image"),
               .init(icon: Image(systemName: "link"), title: "Link")
           ]

           init() {
//               UINavigationBar.appearance().barTintColor = UIColor(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1))
//               UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
               UINavigationBar.appearance().isTranslucent = false
           }//:TabsSwiftUIExample

           var body: some View {
//               NavigationView {
            
            VStack {
                GeometryReader { geo in
                           VStack(spacing: 0) {
                               // Tabs
                               Tabs(tabs: tabs, geoWidth: geo.size.width, selectedTab: $selectedTab)

                               // Views
                               TabView(selection: $selectedTab,
                                       content: {
                                           Demo1View()
                                               .tag(0)
                                           Demo2View()
                                               .tag(1)
                                           
                                       })
                                   .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                           }//:VStack
    //                       .background(Color("bg-1"))
    //                       .edgesIgnoringSafeArea(.all)
    //                       .background(SwiftUI.Color("bg-2").edgesIgnoringSafeArea(.all))

                           .foregroundColor(Color.black)
                           .navigationBarTitleDisplayMode(.inline)
    //                       .navigationTitle("TabsSwiftUIExample")
    //                       .ignoresSafeArea()
                       }//:GeometryReader
                .border(Color.gray)
                .frame(height: 200)
            }
//                   .shadow(radius: 3 )
//               }//:NavigationView
            
           }//:VSTACK

    
}



struct ContentTabsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTabsView()
    }
}
