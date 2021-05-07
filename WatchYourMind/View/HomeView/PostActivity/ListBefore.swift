//
//  ListBefore.swift
//  WatchYourMind
//
//  Created by Gatang on 19/3/2564 BE.
//

import SwiftUI

//struct PresentBefore: Identifiable {
//    var id = UUID()
//    var image: String
//    var effectdes: String
//    var number: Int
//    var unit: String
//}
struct PresentBefore: Identifiable {
    var id = UUID()
    var image: String
    var effectdescription: String
    var number: Int
}
struct ActiveBefore: Identifiable {
    var id = UUID()
    var activeimage: String
    var active: String
}

extension UIScreen{
   static let Width = UIScreen.main.bounds.size.width
   static let Height = UIScreen.main.bounds.size.height
   static let Size = UIScreen.main.bounds.size
}

struct ListBefore: View {
    let modelDataPresentBefore = [
        PresentBefore(image: "moon.stars.fill",effectdescription: "Hour(s) of sleep/day", number: 3),
        PresentBefore(image: "figure.walk", effectdescription: "Exercise is reduced/week", number: 18)]
    
    let modelDataActiveData = [
        ActiveBefore(activeimage:"face.smiling.fill",active: "Hyperactive")
    ]
    

    var body: some View {
        VStack(alignment: .center) {
            Text("BEFORE")
                .font(.system(size: 40))
                .font(.largeTitle)
                .fontWeight(.bold)
            VStack(alignment: .leading){
                
                    ForEach(modelDataPresentBefore){ item in
                        HStack {
                            Image(systemName: item.image)
                            .frame(width: 50, height: 10, alignment: .leading)
                                   Text(item.effectdescription)
                            Spacer()
                            VStack {
                                Text("\(item.number)")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .frame(width: 50, height: 10, alignment: .leading)
                            }
                            
                           }//:HSATCK
                        .padding()
                        .font(.title)
                    }//:ForEach
                    
                    ForEach(modelDataActiveData){ item in
                        HStack {
                            Image(systemName: item.activeimage)
                                .frame(width: 50, height: 10, alignment: .leading)
                            
                            Text(item.active)
                            
                        }
                        .padding()
                        .font(.title)
                    }

                   }//:VStack
                
            .frame(width: 400,height: 300, alignment: .center)
 
                .overlay(
                        RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 2))
                .padding(.horizontal)
              
            .shadow(radius: 30)
        }//:VSTACK
        .padding()
            

               
        
}
}

struct ListBefore_Previews: PreviewProvider {
    static var previews: some View {
        ListBefore()
            .previewLayout(.sizeThatFits)
    }
}
