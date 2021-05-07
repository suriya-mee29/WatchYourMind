//
//  DatePicker.swift
//  WatchYourMind
//
//  Created by Gatang on 26/2/2564 BE.
//

import SwiftUI

struct CalendarPicker: View {
//struct DatePicker<Label> where Label : View{
    
    
    //MARK:-PROPERTIES
    @State private var date = Date()
    @Binding var datePicker : Date
    
    
    //MARK:-BODY
    var body: some View {

        DatePicker("",selection : $datePicker,displayedComponents: [.date])
                        .labelsHidden()

    }//:body
}//:CalendarPicker




//MARK:-PREVIEW
struct CalendarPicker_Previews: PreviewProvider {
    static var previews: some View {
        CalendarPicker(datePicker: .constant(Date()))
            //.previewLayout(.sizeThatFits)
    }
}
