//
//  PsychologistManagement.swift
//  WatchYourMind
//
//  Created by Suriya on 7/5/2564 BE.
//

import Foundation
import Firebase

class PsychologistManagement : ObservableObject {
    private let docRef = Firestore.firestore()

    
    
    public func signIn(email:String , pwd : String ,completion: @escaping(Bool,String)->Void){
        let authentication = Auth.auth()
        print("authen")
        
        self.docRef.collection("users")
            .whereField("type", isEqualTo: "psychologist").getDocuments { querySnapshot, error in
                if let error = error {
                    completion(false , "error from signIn,Check Type User \(error)")
                }else{
                    if let doucuments = querySnapshot?.documents{
                        print("test doc count \(doucuments.count)")
                        if doucuments.count > 0{
                            for i in 0...doucuments.count-1 {
                                let document = doucuments[i]
                                if document["type"] as! String == "psychologist" {
                                    authentication.signIn(withEmail: email, password: pwd) {result, error in
                                        
                                        if result != nil{
                                            //200 ok
                                            let userdefults = UserDefaults.standard
                                                userdefults.set(true, forKey: "USER_AUTHEN")
                                            let em :String = email.lowercased()
                                            print(em)
                                            userdefults.set(em, forKey: "CURRENT_USER")
                                            print("user authen")
                                            completion(true,email)
                                            
                                            
                                        }else{
                                            //error
                                            completion(false,"\(error?.localizedDescription)")
                                            
                                        }
                                    }
                                }else{
                                    completion(false,"You do not have permission to sign in,  for the psychologist.")
                                }
                            }
                            
                        }else{
                            completion(false , "not found psychologist, the data might delete")
                        }
                    }
                    
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
