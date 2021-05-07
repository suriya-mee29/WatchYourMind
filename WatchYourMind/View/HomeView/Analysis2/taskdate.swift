//
//  taskdate.swift
//  WatchYourMind
//
//  Created by Gatang on 21/3/2564 BE.
//

import SwiftUI

let taskdate: DateFormatter = {
    let format = DateFormatter()
    format.dateFormat = "yyyy/MM/dd HH:mm"
//    format.dateStyle = .long
    return format
}()
