//
//  DatepickerView.swift
//  WatchYourMind
//
//  Created by Gatang on 18/3/2564 BE.
//

import SwiftUI

struct DatepickerView: View {
    @State var selectedDate = Date()
    

    
    var body: some View {
        VStack {
//
//
//
//                DatePicker("", selection: $selectedDate, displayedComponents: .date)
//
//
//            Text("Your selected date: \(selectedDate)")
//            }.padding(.leading)
        
     
            DatePicker("", selection: $selectedDate, displayedComponents: [.date])
            
                       

        }.fixedSize()
    }
}

struct DatepickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatepickerView().previewLayout(.sizeThatFits)
    }
}
