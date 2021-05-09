//
//  ContentTabsView.swift
//  WatchYourMind
//
//  Created by Gatang on 16/3/2564 BE.
//

import SwiftUI

struct ContentTabsView: View {
       @Binding var photo_file : Image?
       @Binding var link_file : String
        @State private var selectedTab: Int = 0
        @State private var totalHeight = CGFloat(100) // no matter - just for static Preview !!


           let tabs: [Tab] = [
               .init(icon: Image(systemName: "photo"), title: "Image"),
               .init(icon: Image(systemName: "link"), title: "Link")
           ]

    init(photo_file : Binding<Image?> , link_file : Binding<String>) {
        self._photo_file = photo_file
        self._link_file = link_file
        

               UINavigationBar.appearance().isTranslucent = false
           }

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
                                        UploadFileContent( selectedImage: self.$photo_file)
                                               .tag(0)
                                        Demo2View(text: self.$link_file)
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
        ContentTabsView(photo_file: .constant(Image("")), link_file: .constant(""))
    }
}
