//
//  PsychologistManagement.swift
//  WatchYourMind
//
//  Created by Suriya on 7/5/2564 BE.
//

import Foundation
import Firebase

class PsychologistManagement : ObservableObject {
    
    
    public func signIn(email:String , pwd : String ,completion: @escaping(Bool,String)->Void){
        let authentication = Auth.auth()
        print("authen")
        authentication.signIn(withEmail: email, password: pwd) {result, error in
            
            if result != nil{
                //200 ok
                let userdefults = UserDefaults.standard
                    userdefults.set(true, forKey: "USER_AUTHEN")
                    userdefults.set(email, forKey: "CURRENT_USER")
                print("user authen")
                completion(true,email)
            }else{
                //error
                completion(false,"\(error?.localizedDescription)")
                
            }
        }
       
    }
    
    public func singOut(completion: @escaping(Bool,String)->Void){
        let authentication = Auth.auth()
        do{
            try authentication.signOut()
            let userdefults = UserDefaults.standard
                userdefults.set(false, forKey: "USER_AUTHEN")
                userdefults.set("", forKey: "CURRENT_USER")
            completion(true,"sing out seccsee")
        }catch{
            completion(false,error.localizedDescription)
        }
        
    }
    
}
