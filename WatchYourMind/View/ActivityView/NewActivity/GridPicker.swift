//
//  GridPicker.swift
//  WatchYourMind
//
//  Created by Gatang on 16/3/2564 BE.
//

import SwiftUI

enum Items: String, CaseIterable, Equatable {
    case item1 = "PICTURE"
    case item2 = "URL LINK"
  
    
    var name: String {
        switch self {
              case .item1: return "reqPhoto"
              case .item2: return "reqLink"
        }
    }
  
}
//private var symbols = ["photo","video","mic","link"]


struct GridPicker: View {

    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    @Binding  var selectedItems: [Items]
    
    
    var body: some View {
//        NavigationView {
        HStack(alignment: .center){
            ScrollView(.horizontal) {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(Items.allCases, id: \.self) { item in
                        HStack(alignment:.center){
                        GridColumn(item: item, items: $selectedItems)
                        }
//                            .padding()
                    }
                }//:LazyVstack
            }
        }//:HSTACK
//        }
//        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}



struct GridColumn:View {
    let item: Items
    
    @Binding var items: [Items]
    
    
    var body: some View {
//        HStack(alignment:.center){
        Button(action: {
            if items.contains(item) {
                items.removeAll() { $0 == item}
            } else {
                items.append(item)
            }
        }, label: {
            Text(item.rawValue)
                .font(.system(size: 15))
                .tag(item)
                .foregroundColor(items.contains(item) ? .white : .purple)
//                .padding(.vertical,5)
        })
//        }
        .frame(width: 130, height: 50)
        .padding(.horizontal)
        .background(items.contains(item) ? Color("activeColor") : Color("completeColor"))        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//        .padding(.vertical,5)
        .padding(.horizontal,100)
    }
}

struct GridPicker_Previews: PreviewProvider {
    static var previews: some View {
        GridPicker( selectedItems: .constant([]))
    }
}

