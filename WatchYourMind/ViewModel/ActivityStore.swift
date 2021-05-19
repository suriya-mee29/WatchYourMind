//
//  ActivityStore.swift
//  WatchYourMind
//
//  Created by Suriya on 9/5/2564 BE.
//

import Foundation
import Firebase

class ActivityStore : ObservableObject {
    @Published var activityList : [ActivityModel] = [ActivityModel]()
    @Published var maualActivityList : [ActivityModel] = [ActivityModel]()
    private let docRef = Firestore.firestore()
    private let storage = Storage.storage()
    
    init (){
        // store from db
        self.fetchActivity(isAuto: false) { succsee, err in
            if succsee {
                print("fetching manual activities done...")
                
            }else{
                print(err)
            }
        }
        self.fetchActivity(isAuto: true) { succsee, err in
            if succsee {
                print("fetching auto activities done...")
                
            }else{
                print(err)
                
            }
        }
    }
    
    func setResults(result : [String: Any] ,completion : @escaping(Bool,String)->Void){
        
   
                let docKey = result["title"] as? String
                print("docKey-----\(docKey!)")
        
                let df = docRef.collection("activities").document(docKey!).setData(result){ err in
                    if let err = err {
                        print("Error writing document: \(err)")
                        completion(false,"Error writing document: \(err)")
                    } else {
                        print("Document successfusample.startDatelly written!")
                        completion(true,"Document successfully written!")
                    }
                }
                
                
            
            
       
    }

    public func storePicture(data : Data  ,completion : @escaping (Bool,String)->Void ){
        let storageRef = storage.reference()
        let riversRef = storageRef.child("attachedfileactivities/\(UUID()).jpg")
        
        // Create the file metadata
        let metadatas = StorageMetadata()
        metadatas.contentType = "image/jpeg"
        
        let uploadTask = riversRef.putData(data, metadata: metadatas) { (metadata, error) in
          guard let metadata = metadata else {
            // Uh-oh, an error occurred!
            completion(false,"error: \(error?.localizedDescription)")
            return
          }
            // Metadata contains file metadata such as size, content-type.
            let size = metadata.size
            // You can also access to download URL after upload.
            riversRef.downloadURL { (url, error) in
              guard let downloadURL = url else {
                // Uh-oh, an error occurred!
                completion(false,"error: \(error?.localizedDescription)")
                return
              }
                completion(true,downloadURL.absoluteString)
            }
        }
        
    }
    
    public func fetchActivity(isAuto:Bool,completion : @escaping (Bool,String)->Void){
        let userdefults = UserDefaults.standard
        let username = userdefults.string(forKey: "CURRENT_USER")
        print("username: \(username!)")
         docRef.collection("activities")
            .whereField("createdby", isEqualTo: isAuto ? "default" : username!)
            .getDocuments { querySnapshot, error in
                if let err = error {
                    print("Error getting documents: \(err)")
                    completion(false,err.localizedDescription)
                }
                
                if isAuto{
                    self.maualActivityList.removeAll()
                }else{
                    self.activityList.removeAll()
                }
                
                if let documents = querySnapshot?.documents{
                    print(documents.count)
                for ativityDocument in documents {
                    
                    self.calulateAssignedActivities(path: "activities/\(ativityDocument.documentID)/assigned") { success, num in
                        if success{
                            let activity =  ativityDocument.data()
                            let createdby = activity["createdby"] as? String
                            let description = activity["description"] as? String
                            let imageIcon = activity ["imageIcon"] as? String
                            let title = activity["title"] as? String
                            let type = activity["type"] as? String
                            let docKey = ativityDocument.documentID
                            
                            var activityModel = ActivityModel(createdby: createdby!, description: description!, imageIcon: imageIcon!, title: title!, type: type!, dockey: docKey)
                            
                         
                            
                            // optional
                            if activity["link"] != nil {
                                let link = activity["link"] as? String
                                activityModel.setLink(link: link!)
                            }
                            if activity["photoURL"] != nil {
                                let photoURL = activity["photoURL"] as? String
                                activityModel.setPhotoURL(photoURl: photoURL!)
                            }
                            if activity["outcomeReq"] != nil {
                                let outcomeReq = activity["outcomeReq"] as? [String]
                                activityModel.setOutcomeReq(outcomeReq: outcomeReq!)

                            }
                            if activity["createdDate"] != nil {
                                let createdDate = activity["createdDate"] as? Timestamp
                                activityModel.setCreatedDate((createdDate?.dateValue())!)
                            }
                            activityModel.setCount(count: num)
                            
                            if isAuto{
                                self.activityList.append(activityModel)
                            }else{
                                self.maualActivityList.append(activityModel)
                            }

                        }
                    }
                
                    
                }//LOOP
                    completion(true,"")
                }// eof - if document is not nil
                }
           
        
    }
    private func calulateAssignedActivities (path : String , completion : @escaping (Bool,Int)->Void ){
        self.docRef.collection(path).getDocuments { querySnapshot, error in
            if let error = error {
                print("error from calulateAssignedActivities \(error.localizedDescription)")
            }
            
            if let documents = querySnapshot?.documents{
                completion(true, documents.count)
            }else{
                completion(false , -1)
            }
            
        }
        
    }
}
