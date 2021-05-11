//
//  UserModel.swift
//  WatchYourMind
//
//  Created by Suriya on 10/5/2564 BE.
//

import Foundation
struct UserModel :  Codable {
    let timestamp : TimeInterval
    var status : Bool
    let message : String
    let data : DataUserModel
    
    init( timestamp : TimeInterval , status : Bool , message : String , data : DataUserModel) {
       
        self.timestamp = timestamp
        self.status = status
        self.message = message
        self.data = data
    }
}
