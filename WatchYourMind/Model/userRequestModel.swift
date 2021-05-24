//
//  userRequestModel.swift
//  WatchYourMind
//
//  Created by Gatang on 7/5/2564 BE.
//

import SwiftUI

struct userRequest: Identifiable {
    var id = UUID()
    var imageUser : String
    var nameTH: String
    var nameEN: String
    var email: String
    var faculty: String
    var branch: String
    var progress: Int
    var progressColor: String
    var dateEndup: String
    var dateAssign: String
    var status: String
    var gender: String
}
