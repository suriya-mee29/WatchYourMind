//
//  RadioButtonGroups.swift
//  WatchYourMind
//
//  Created by Gatang on 2/3/2564 BE.
//

import SwiftUI

enum Effect: String {
    case  hyperactive = "hyperactive"
    case hypoactive = "hypoactive"
}

struct RadioButtonGroups: View {
    let callback: (String) -> ()
    
    @State var selectedId: String = ""
    
    var body: some View {
        HStack {
           
            radioMaleMajority
            radioFemaleMajority
            
        }
    }
    
    var radioMaleMajority: some View {
        
        HStack{
        RadioButtonField(
            id: Effect.hyperactive.rawValue,
            label: Effect.hyperactive.rawValue,
            isMarked: selectedId == Effect.hyperactive.rawValue ? true : false,
            callback: radioGroupCallback
        )
        }
    }
    
    var radioFemaleMajority: some View {
//        HStack{

        RadioButtonField(
            id: Effect.hypoactive.rawValue,
            label: Effect.hypoactive.rawValue,
            isMarked: selectedId == Effect.hypoactive.rawValue ? true : false,
            callback: radioGroupCallback
        )
//    }
    }
    
    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}
