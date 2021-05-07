//
//  ManualActivtyView.swift
//  WatchYourMind
//
//  Created by Gatang on 19/4/2564 BE.
//

import SwiftUI
import Foundation
class ManualActivtyViewModel: ObservableObject {
    @Published var arrManualActivity: [ManualActivityModel]?
    var counUaerActivity:Int = 3
    
    init() {
        let usedefults = UserDefaults.standard
        let key = "MANUAL"
        
        do {
            let storedManualActivity = usedefults.object(forKey: key)
            if storedManualActivity != nil {
                let  storeItems = try JSONDecoder().decode([ManualActivityModel].self , from: storedManualActivity as! Data)
                self.arrManualActivity = storeItems
                
            }else{
                self.arrManualActivity = []
            }
            
        }catch let err{
            print(err)
        }
    }
    
    public func PersonCount()->Int{
        //Query PersnCount by ActivityId
        return counUaerActivity
    }
    
    
    public func AddActivity(manualActivityModel: ManualActivityModel){
        arrManualActivity?.append(manualActivityModel)
        self.saveUserData(arr: self.arrManualActivity!)
    }
    
    
    public func DeleteActivity(deleteActivity: Int ){
        arrManualActivity?.remove(at: deleteActivity)
    }
    
    private func saveUserData (arr : [ManualActivityModel]){
        let usedefults = UserDefaults.standard
        let key = "MANUAL"
        if let activityEncode = try? JSONEncoder().encode(arr){
            usedefults.set(activityEncode, forKey: key)
        }
    }
    
}
