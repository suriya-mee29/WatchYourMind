//
//  ActivityModel.swift
//  WatchYourMind
//
//  Created by Suriya on 9/5/2564 BE.
//

import Foundation
struct ActivityModel : Codable, Identifiable{
    let id : UUID
    let createdby : String
    let description : String
    let imageIcon : String
    let title : String
    let type : String
    
    var outcomeReq : [String]
    var link : String
    var photoURL : String
    var count : Int
    
    var createdDate : Date?
    
    init(id : UUID = UUID(),createdby : String , description : String , imageIcon : String ,title : String, type : String , outcomeReq : [String] = [] , link : String = "", photoURL : String = "" , createdDate: Date ){
        
        self.id = id
        self.createdby = createdby
        self.description = description
        self.imageIcon = imageIcon
        self.title = title
        self.type = type
        
        self.outcomeReq = outcomeReq
        self.link = link
        self.photoURL = photoURL
        self.count = 0
        self.createdDate = createdDate
    }
    init(id : UUID = UUID(),createdby : String , description : String , imageIcon : String ,title : String, type : String , outcomeReq : [String] = [] , link : String = "", photoURL : String = "" ){
        
        self.id = id
        self.createdby = createdby
        self.description = description
        self.imageIcon = imageIcon
        self.title = title
        self.type = type
        
        self.outcomeReq = outcomeReq
        self.link = link
        self.photoURL = photoURL
        self.count = 0
        self.createdDate = nil
    }
    mutating func setLink (link: String){
        self.link = link
    }
    mutating func setPhotoURL(photoURl:String){
        self.photoURL = photoURl
    }
    mutating func setOutcomeReq(outcomeReq : [String]){
        self.outcomeReq = outcomeReq
    }
    mutating func setCount(count : Int){
        self.count = count
    }
    mutating func setCreatedDate( _ date : Date){
        self.createdDate = date
    }
}
