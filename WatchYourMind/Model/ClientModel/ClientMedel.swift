//
//  ClientMedel.swift
//  WatchYourMind
//
//  Created by Suriya on 11/5/2564 BE.
//

import Foundation
struct ClientModel : Identifiable {
    let student : UserModel
    let id : UUID
    
    init(id: UUID , student : UserModel) {
        self.id = id
        self.student = student
    }
}
