//
//  ManualActivityModel.swift
//  WatchYourMind
//
//  Created by Gatang on 19/4/2564 BE.
//

import SwiftUI

struct ManualActivityModel: Codable, Identifiable {
  
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

