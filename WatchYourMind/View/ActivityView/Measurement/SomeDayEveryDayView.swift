//
//  SomeDayEveryDayView.swift
//  WatchYourMind
//
//  Created by Gatang on 22/3/2564 BE.
//

import SwiftUI

struct SomeDayEveryDayView: View {
    var body: some View {
        
        VStack(alignment: .center) {
            FrequencyActivityView()
                
            FrequencyActivityView2()
                .padding(.leading,10)
        }
        .fixedSize()
    }
}

struct SomeDayEveryDayView_Previews: PreviewProvider {
    static var previews: some View {
        SomeDayEveryDayView().previewLayout(.sizeThatFits)
    }
}
