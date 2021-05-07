//
//  StatusListItemView.swift
//  WatchYourMind
//
//  Created by Gatang on 5/5/2564 BE.
//

import SwiftUI

struct StatusListItemView: View {
    let animals : [Animal]
    @State var showSheetView = false
    var body: some View {
//        HStack(alignment: .center) {
            VStack(alignment: .center,spacing: 0){
    //            NavigationView {
               Spacer()
                    List(animals) { trail in
//                        Spacer()
                        HStack(alignment: .center) {
                            Spacer()
                        VStack(alignment: .center){
                        AnimalListItemView(animal: trail, create: Date())
                        }
                            Spacer()
                    }
                    }//:List
//                Spacer()
                
              
            }
//        }//:HSTACK
//        .ignoresSafeArea( edges: .leading)
//        .frame(width:UIScreen.Widthscreen-60)
        
    }
}

struct StatusListItemView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        StatusListItemView(animals: animals)
    }
}
