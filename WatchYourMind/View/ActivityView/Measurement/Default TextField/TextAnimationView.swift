//
//  TextAnimationView.swift
//  WatchYourMind
//
//  Created by Gatang on 11/5/2564 BE.
//

import SwiftUI

struct TextAnimationView: View {
//    @ObservedObject var input = TextLimiter(limit: 5)
//    var body: some View {
//        TextField("Text Input",
//                    text: $input.value)
//                    .border(Color.red,
//                            width: $input.hasReachedLimit.wrappedValue ? 1 : 0 )
//
//    }
    
    //--------------------
    
    @ObservedObject var input = NumbersOnly()
        
        var body: some View {
            TextField("Input", text: $input.value)
                .padding()
                .keyboardType(.decimalPad)
        }
}

struct TextAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        TextAnimationView()
    }
}


//class TextLimiter: ObservableObject {
//    private let limit: Int
//
//    init(limit: Int) {
//        self.limit = limit
//    }
//
//    @Published var value = "" {
//        didSet {
//            if value.count > self.limit {
//                value = String(value.prefix(self.limit))
//                self.hasReachedLimit = true
//            } else {
//                self.hasReachedLimit = false
//            }
//        }
//    }
//
//    @Published var hasReachedLimit = false
//}

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}
