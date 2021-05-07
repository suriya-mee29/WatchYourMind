//
//  SearchView2Continue.swift
//  WatchYourMind
//
//  Created by Gatang on 25/3/2564 BE.
//

import SwiftUI

struct SearchView2Continue: View {
    @State private var searchText = ""
    
    private var todoItems = [ToDoItem(name: "Tawiporn Tadkaew", idusername: "6009650398"),
                              ToDoItem(name: "Suriya Meekhuntod", idusername:"6009650026" ),
                              ToDoItem(name: "Natnichar Yingyongdamrongsakun", idusername: "6009650505"),
                              ToDoItem(name: "Patcharajak Yongwatthana", idusername: "6009650109"),
                              ToDoItem(name: "Charinrat Soratsa", idusername: "6009650034"),
                              ToDoItem(name: "Tawiporn Tadkaew", idusername: "6009650398")
                                ]
    

    var body: some View {
        
//        HStack {
//            ZStack {
                
                VStack {
//                    SearchView2()
//                      .environment(\.colorScheme, .light)
//                .padding(.top, -30)
            
            List(todoItems.filter({ searchText.isEmpty ? true : $0.name.contains(searchText)||$0.idusername.contains(searchText) })) { item in
                Text(item.name)
                Text(item.idusername)
                
            }//:List
              
                }//:VStack
//                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//            }//:ZStack
//        }//:HSATCK
        
    }
}

struct SearchView2Continue_Previews: PreviewProvider {
    static var previews: some View {
        SearchView2Continue().previewLayout(.sizeThatFits)
    }
}
