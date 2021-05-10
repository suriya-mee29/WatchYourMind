//
//  Client.swift
//  WatchYourMind
//
//  Created by Suriya on 10/5/2564 BE.
//

import Foundation
class Client : ObservableObject {
    private let APIKey : String = "TU65e1f570077f0be33201447720639c54202fd702e3562b2f028583481706a462eb85b37bc82989b425fd926959ba9809"
    
    
    
    private func fetchStdInfoFromTU_API(username: String , completion : @escaping (UserModel? ,Bool,String) -> Void ){
        // Create URL
        let url = URL(string: "\(stdInfoURL)\(username)")
        guard let requestUrl = url else { fatalError("request url:\(url?.absoluteString ?? "error") is false ") }
        
        // Create URL Request
        var request = URLRequest(url: requestUrl)
        
        // Specify HTTP Method to use
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(APIKey, forHTTPHeaderField: "Application-Key")
        
        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
        
            // Convert HTTP Response Data to UserModel
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                // caovert to json
                if let  res = response as? HTTPURLResponse{
                    print(res.statusCode)
                    if res.statusCode == 200 {
                        print("\(dataString)")
                        let myData = Data(dataString.utf8)
                        let myUser : UserModel = Bundle.main.decodev2(data)
                        //self.name = myUser.data.displayname_en
                        completion(myUser, true , "seccess")
                    }else{
                        // not fount or ..
                        completion( nil , false , dataString)
                        
                    }
                }
               
                
            }else{
                completion( nil , false , "")
            }
            
            
        }
        task.resume()
    }
}
