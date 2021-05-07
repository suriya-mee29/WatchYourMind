//
//  BeforeAfterListView.swift
//  WatchYourMind
//
//  Created by Gatang on 19/3/2564 BE.
//

import SwiftUI

struct BeforeAfterListView: View {
    
    @State private var isIphone : Bool = true
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
        if !isIphone{
        HStack (alignment: .top){
                ListBefore()
            ListAfter()
        }//:HSTACK
        
        
    }else{
    ListBefore()
ListAfter()
    }//:ELSE
        }//:ScrollView
        
        .onAppear(perform: {
            if UIDevice.current.userInterfaceIdiom == .phone{
               isIphone = true
            }else{
                isIphone = false
            }
        })//:onAppear
    }
}

struct BeforeAfterListView_Previews: PreviewProvider {
    static var previews: some View {
        BeforeAfterListView()
    }
}
