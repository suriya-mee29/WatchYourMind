//
//  DatePic.swift
//  WatchYourMind
//
//  Created by Gatang on 18/3/2564 BE.
//

import SwiftUI

struct ParentDatePicker: View {
    @State var showGraphical: Bool = false
        @Binding var currentDate: Date
        var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd MMM yyyy HH:mm"
            return formatter
        }
        var body: some View {
            Button(action: {
                showGraphical.toggle()
            }, label: {
                Label(
                    title: { Text("\(currentDate, formatter: dateFormatter)") },
                    icon: { Image(systemName: "") })
            })
//            .fixedSize()
//            .padding()
//            .frame(width: 200, height: 50)
//            .background(Color.white)
//            .cornerRadius(8)
//            .shadow(color: Color.black.opacity(0.1), radius: 30, x: 0 , y: 15)
            .sheet(isPresented: $showGraphical, content: {
                CusDatePicker(currentDate: $currentDate)
            })
        }
    }
    struct CusDatePicker: View {
        @Binding var currentDate: Date
        
        var body: some View {
            //https://developer.apple.com/documentation/swiftui/datepicker
            DatePicker("Date", selection: $currentDate, displayedComponents: [.date, .hourAndMinute])
                //.datePickerStyle(CompactDatePickerStyle())
                .datePickerStyle(GraphicalDatePickerStyle())
        }
}

struct ParentDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ParentDatePicker( currentDate: .constant(Date()))
    }
}
