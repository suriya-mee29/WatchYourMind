//
//  AutoActivityViewModel.swift
//  WatchYourMind
//
//  Created by Gatang on 30/4/2564 BE.
//

import SwiftUI

class AutoActivityViewModel: ObservableObject {
    @Published var arrAutoActivity: [AutoActivityModel]?
    var counUaerActivity:Int = 3
    
    init() {
        let usedefults = UserDefaults.standard
        let key = "AUTO"
        
        do {
            let storedAutoActivity = usedefults.object(forKey: key)
            if storedAutoActivity != nil {
                let  storeItems = try JSONDecoder().decode([AutoActivityModel].self , from: storedAutoActivity as! Data)
                self.arrAutoActivity = storeItems
                
            }else{
                self.arrAutoActivity = []
            }
            
        }catch let err{
            print(err)
        }
    }
    
    public func PersonCount()->Int{
        //Query PersnCount by ActivityId
        return counUaerActivity
    }
        
    
}


