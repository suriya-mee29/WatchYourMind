//
//  ToDoItem.swift
//  WatchYourMind
//
//  Created by Gatang on 25/3/2564 BE.
//

import Foundation
import CoreData

enum Priority: Int {
    case low = 0
    case normal = 1
    case high = 2
}

struct ToDoItem: Identifiable {
    var id = UUID()
    var name: String = ""
    var idusername = ""
    var priorityNum: Priority = .normal
    var isComplete: Bool = false
}
