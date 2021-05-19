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
    let dockey : String
    
    var outcomeReq : [String]
    var link : String
    var photoURL : String
    var count : Int
    
    var createdDate : Date?
    
    /// number of days to do activity
    var NoOfDate : Int?
    /// doing activity frequency
    var everyDay : Bool?
    /// rounds pre day
    var round : Int
    /// time in minute
    var time : Int
    
    var indicator : [String]
    
    
    
    init(id : UUID = UUID(),createdby : String , description : String , imageIcon : String ,title : String, type : String , outcomeReq : [String] = [] , link : String = "", photoURL : String = "" , createdDate: Date  ,dockey : String ,round : Int = 0 ,time :Int = 0,indicator : [String] = []){
        
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
        self.dockey = dockey
        
        self.round = round
        self.time = time
        
        self.indicator = indicator
        
    }
    init(id : UUID = UUID(),createdby : String , description : String , imageIcon : String ,title : String, type : String , outcomeReq : [String] = [] , link : String = "", photoURL : String = "" ,dockey : String ,round : Int = 0 ,time :Int = 0,indicator : [String] = []){
        
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
        self.dockey = dockey
        
     
        self.round = round
        self.time = time
        
        self.indicator = indicator
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
    
    mutating func setIndicator(indicators : [String]){
        self.indicator = indicators
    }
    
    /// set Quantify by doing activity everyday
    mutating func setQuantify(everyDay : Bool ,round : Int,time : Int){
        self.everyDay = everyDay
        self.round = round
        self.time = time
    }
    
    /// set Quantify by doing activity someday
    mutating func setQuantify(everyDay : Bool ,round : Int,time : Int,NoOfDate : Int){
        self.everyDay = everyDay
        self.round = round
        self.time = time
        self.NoOfDate = NoOfDate
    }
    
    mutating func setTime(_ time : Int){
        self.time = time
    }
    mutating func setRound(_ round : Int){
        self.round = round
    }
    mutating func setIsEveryday(_ everyday : Bool?){
        self.everyDay = everyday
    }
    mutating func setNumberOfDays(_ No : Int?){
        self.NoOfDate = No
    }
    
    
}
