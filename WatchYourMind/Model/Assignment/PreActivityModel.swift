//
//  AssignmentModel.swift
//  WatchYourMind
//
//  Created by Suriya on 12/5/2564 BE.
//

import Foundation
struct PreActivityModel: Codable {
    let presentation : String
    let precipitance : [String : [String:Bool]]
    let pattern : String
    let faultyThinking : String
    let intensityLevel : Double
    let emotionLevel : String
    let event : String
    let stateProblem : Int
    var effect =  [String:String]()
    
  
    func getdate() -> [String:Any] {
        var data = [String:Any]()
        data["presentation"] = self.presentation
        data["precipitance"] = self.precipitance
        data["pattern"] = self.pattern
        data["faultyThinking"] = self.faultyThinking
        data["intensityLevel"] = self.intensityLevel
        data["emotionLevel"] = self.emotionLevel
        data["event"] = self.event
        data["stateProblem"] = self.stateProblem
        data["effect"] = self.effect
        
        return data
    }
    mutating func setEffact (_ eff :[String:String] ){
        self.effect = eff
    }
    enum CodingKeys: String, CodingKey {
          case presentation = "presentation"
          case precipitance = "precipitance"
          case pattern = "pattern"
          case faultyThinking = "faultyThinking"
          case intensityLevel = "intensityLevel"
          case emotionLevel = "emotionLevel"
          case event = "event"
          case stateProblem = "stateProblem"
        
         
      }
    
}
