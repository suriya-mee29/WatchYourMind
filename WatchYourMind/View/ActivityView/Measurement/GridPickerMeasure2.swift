//
//  GridPickerMeasure2.swift
//  WatchYourMind
//
//  Created by Gatang on 31/3/2564 BE.
//

import SwiftUI

enum Range: String, CaseIterable, Equatable {
    case name1 = "SCALE"
    case name2 = "NOTE"
    case name3 = "HEART RATE"
    
    var name : Image {
        switch self {
              case .name1: return Image(systemName: "photo")
        case .name2: return Image(systemName:"video")
        case .name3: return Image(systemName:"mic")
     
        }
    }
    var nameStr : String{
        switch self {
        case .name1: return "scaling"
        case .name2 : return "noting"
        case .name3 : return "hr"
    }
  
}
}
//private var symbols = ["photo","video","mic","link"]

struct GridPickerMeasure2: View {
    

    
   var flexibleLayout = [GridItem(.flexible()), GridItem(.flexible())]
        
    @Binding var activity : [ActivityModel]
    let seletedAnActivity : ActivityModel
    @State  var selectedItems2: [Range] = []
    func setArr(range : [Range]) -> [String] {
        var strarr = [String]()
        if range.count > 0{
            for i in 0...range.count-1{
                strarr.append(range[i].nameStr)
            }
            return strarr
        }else{
            return []
        }
       
    }
    
    var body: some View {
//        ScrollView{
            LazyVGrid(columns: flexibleLayout, spacing: 0) {

                ForEach(Range.allCases, id: \.self) { name in
                    GridMeasureColumn2(name: name, names:$selectedItems2)
                }
//                .padding(.horizontal)
                .padding(.vertical)
            }//:LazyVGrid
            .onChange(of: selectedItems2, perform: { value in
                for i in 0...self.activity.count-1{
                    if seletedAnActivity.id == activity[i].id {
                        activity[i].setIndicator(indicators: self.setArr(range: self.selectedItems2))
                    }
                }
            })
//        }
        
    }
}



struct GridMeasureColumn2:View {
    let name: Range

    @Binding var names: [Range]
    
    
    
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

struct GridPickerMeasure2_Previews: PreviewProvider {
    static var previews: some View {
        GridPickerMeasure2(activity: .constant([]), seletedAnActivity: ActivityModel(createdby: "koi", description: "hello hello", imageIcon: "gamer", title: "Music Relexation1", type: "MANUAL", createdDate: Date(), dockey: "key")).previewLayout(.sizeThatFits)
    }
}
