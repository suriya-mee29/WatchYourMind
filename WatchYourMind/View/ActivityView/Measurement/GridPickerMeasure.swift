//
//  GridPickerMeasure.swift
//  WatchYourMind
//
//  Created by Gatang on 17/3/2564 BE.
//

import SwiftUI

enum nameRange: String, CaseIterable, Equatable {
    case name1 = "PICTURE"
    case name2 = "VIDEO"
    case name3 = "URL LINK"
    case name4 = "VOICE RECORD"
    
    var name: Image {
        switch self {
              case .name1: return Image(systemName: "photo")
        case .name2: return Image(systemName:"video")
        case .name3: return Image(systemName:"mic")
        case .name4: return Image(systemName:"link")
        }
    }
  
}
//private var symbols = ["photo","video","mic","link"]

struct GridPickerMeasure: View {
    

    
    private var flexibleLayout = [GridItem(.flexible()), GridItem(.flexible())]
        

    @State  var selectedItems: [nameRange] = []
    
    var body: some View {
//        ScrollView{
            LazyVGrid(columns: flexibleLayout, spacing: 0) {

                ForEach(nameRange.allCases, id: \.self) { name in
                    GridMeasureColumn(name: name, names:$selectedItems)
//                        .padding(.horizontal,30)
                }
//                .padding(.horizontal)
                .padding(.vertical)
            }//:LazyVGrid
//        }
        
    }
}



struct GridMeasureColumn:View {
    let name: nameRange

    @Binding var names: [nameRange]
    
    
    var body: some View {
        
//        VStack(alignment: .center) {
//            HStack(alignment: .center) {
                Button(action: {
                    if names.contains(name) {
                        names.removeAll() { $0 == name}
                    } else {
                        names.append(name)
                    }
                }, label: {
                    Text(name.rawValue)
                        .font(.system(size: 15))
        //                .tag(name)
                        .foregroundColor(names.contains(name) ? .black : .white)
                       
                })
                .frame(width: 130, height: 40)
//            }
                
//                .frame(minWidth: 0, maxWidth: 200, minHeight: 50)
                
                .background(names.contains(name) ? Color("activeColor") : Color("completeColor"))
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        //        .padding(.vertical,5)
//                .padding(.horizontal,120)
            
        
        
//        .padding(.horizontal)
    }
}

struct GridPickerMeasure_Previews: PreviewProvider {
    static var previews: some View {
        GridPickerMeasure().previewLayout(.sizeThatFits)
    }
}
