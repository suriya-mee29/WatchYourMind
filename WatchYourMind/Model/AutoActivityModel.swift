//
//  AutoActivityModel.swift
//  WatchYourMind
//
//  Created by Gatang on 9/3/2564 BE.
//

import SwiftUI

struct AutoActivityModel: Codable, Identifiable {
    let id: String
    var createby: String
    let title: String
    let description: String
    let createDate: Date
    let type: String
    let imageicon: String
    let link: String
    let pic : String
    let outcome: [String]
    

}
