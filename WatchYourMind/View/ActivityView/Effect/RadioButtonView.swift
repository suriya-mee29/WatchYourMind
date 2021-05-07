//
//  RadioButtonView.swift
//  WatchYourMind
//
//  Created by Gatang on 2/3/2564 BE.
//

import SwiftUI

struct RadioButtonView: View {
    var body: some View {
        HStack(spacing: 8) {
//                    Text("Gender")
//                        .font(Font.headline)

                    RadioButtonGroups { selected in
                        print("\(selected)")
                    }.padding()
            }
                }
    
}
    



struct RadioButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonView().previewLayout(.sizeThatFits)
    }
}
