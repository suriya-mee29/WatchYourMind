//
//  AssignmentViewModel.swift
//  WatchYourMind
//
//  Created by Suriya on 17/5/2564 BE.
//

import Foundation
import Firebase

class AssignmentViewModel  {
    private let docRef = Firestore.firestore()
    
    func increaseAssignedClient (clientUsername : String , selectedActivity:[ActivityModel] , completion : @escaping(Bool , String?)->Void){
        if selectedActivity.count > 0 {
        for activity in selectedActivity{
            self.docRef.collection("activities/\(activity.dockey)/assigned").document(clientUsername).setData(["username":clientUsername]){ err in
                if let err = err {
                    completion(false ,"error from increaseAssignedClient \(err)")
                }else{
                    completion(true,nil)
                    
                }
                
            }
        }
        }
        
        
    }
    
    
    func assignment(preActivity : [String:Any] ,clientUsername :String ,assignee :String, assignment : [String:Any] ,selectedActivity : [ActivityModel], completion :@escaping (Bool,String)->Void){
        print("(1) confirmClient")
        self.confirmClient(client: clientUsername) { ConfirmClientSuccess , msg1 in
            if ConfirmClientSuccess {
                DispatchQueue.main.async {
                    print("(2) setCurrent")
                    self.setCurrent(usernume: clientUsername) { setCurrentSuccess, msg2 in
                        if setCurrentSuccess{
                            DispatchQueue.main.async {
                                print("(3) addPreActivity")
                                self.addPreActivity(preActivity: preActivity) { addPreActivitySuccess, refID in
                                    if addPreActivitySuccess{
                                        DispatchQueue.main.async {
                                            self.assignActivities(refID: refID, assignee: assignee, assignment: assignment, client: clientUsername) { assignActivitiesSuccess, msg3, documentId  in
                                                if assignActivitiesSuccess{
                                                    DispatchQueue.main.async {
                                                        print("(4) assignSelectedActivity")
                                                        self.assignSelectedActivity(selectedActivities: selectedActivity, path: "assignment/\(documentId!)/activityList") { assignSelectedActivitySuccess, er in
                                                           
                                                                if assignSelectedActivitySuccess{
                                                                    DispatchQueue.main.async {
                                                                        print("(5) increaseAssignedClient")
                                                                        self.increaseAssignedClient(clientUsername: clientUsername, selectedActivity: selectedActivity) { increasedAssignedClientSucc, err2 in
                                                                            if increasedAssignedClientSucc{
                                                                            print("all done")
                                                                            completion(true,"done")
                                                                            }else{
                                                                                print("error \(err2 ?? "error")")
                                                                                completion(false,err2 ?? "error")
                                                                            }
                                                                        }
                                                                    }
                                                                }else{
                                                                    print("error \(er ?? "error")")
                                                                    completion(false,er ?? "error")
                                                                }
                                                        }
                                                    }
                                                }else{
                                                    print("can not assignActivities-->\(msg3)")
                                                    completion(false,"can not assignActivities-->\(msg3)")
                                                }
                                            }
                                        }
                                        
                                    }else{
                                        print("can not addPreActivity-->\(refID)")
                                        completion(false,"can not addPreActivity-->\(refID)")
                                    }
                                }
                            }
                            
                        }else{
                            print("can not confirmClient-->\(msg2)")
                            completion(false,"can not confirmClient-->\(msg2)")
                        }
                    }
                }
            }else{
                print("can not confirmClient-->\(msg1)")
                completion(false,"can not confirmClient-->\(msg1)")
            }
        }
        
    }
    
    func assignSelectedActivity(selectedActivities : [ActivityModel] ,path : String , completion : @escaping (Bool,String?) ->Void){
        //assignment/{qOYI2o7sY9U6xzYdh7kk}/activityList/{mindfulness}
       
        if selectedActivities.count > 0{
        for activity in selectedActivities{
            var dataToSave : [String:Any] = ["activities":self.docRef.document("activities/\(activity.dockey)"),
                              "everyDay" : activity.everyDay!,
                              "time": activity.time,
                              "round" : activity.round
            ]
            if !(activity.everyDay ?? true){
                dataToSave["NoOfDate"] = activity.NoOfDate
            }
            if activity.type != "AUTO"{
                dataToSave["indicator"] = activity.indicator
            }
            self.docRef.collection(path).document("\(activity.dockey)").setData(dataToSave){ err in
                if let err = err {
                    completion(false,"error from assignSelectedActivity \(err)")
                }else{
                    print("add collection done..")
                    completion(true , nil)
                }
            }
            
        }
        }
    }
    
    
    
    public func confirmClient(client: String, completion :@escaping (Bool,String)->Void){
        docRef.collection("users").getDocuments { querySnapshot, err in
            if let err = err {
                completion(false,"Error updating document,setCurrent: \(err)")
            }
            if let documents = querySnapshot?.documents{
                for user in documents {
                    if user.documentID == client{
                        if let status = user["status"] as? String{
                            if status == "inactive"{
                                // update
                                let userRef = self.docRef.collection("users").document(user.documentID)
                                    .updateData([
                                        "status" : "active"
                                    ]){ error in
                                        if let err = error {
                                            completion(false,"Error updating document,confirmClient: \(err)")
                                        } else {
                                            completion(true,"Document successfully updated,confirmClient")
                                        }
                                    }
                            }else{
                                completion(true , "user already activated")
                            }
                        }else{
                            completion(false, "data structure out of (status)")
                        }
                    }else{
                        completion(false,"client not found")
                    }
                }//LOOP
            }else{
                completion(false,"error, con not get the querySnapshot documents")
            }
        }
        
    }
    
    public func assignActivities(refID :String ,assignee :String , assignment : [String:Any] , client :String , completion :@escaping (Bool,String,String?)->Void){
        print("begin assignActivities")
                        var newdata = assignment
                        newdata["current"] = true
                        newdata["assignee"] = assignee
                        newdata["client"] = client
                        // to get referance
                        newdata["preActivity"] = self.docRef.document("factor/\(refID)")
                        print("preActivity data to save: \(newdata)")

                       var rf = self.docRef.collection("assignment").addDocument(data: newdata){ err in
                            if let err = err{
                                
                                completion(false,"error from add assignment: \(err)",nil)
                            }else{
                                print("assignActivities get documentID --> \(rf.documentID)")
                                completion(true,"200 ok",rf.documentID)
                            }
        
        
        
        

                }
    }
     func addPreActivity(preActivity : [String:Any]  ,completion :@escaping (Bool,String)->Void){
        print("addPreActivity")
        var ref  = docRef.collection("factor").addDocument(data: preActivity) { err in
            if let err = err {
                completion(false,"Error addPreActivity: \(err)")
            }else {
                completion(true,"\(ref.documentID)")
                
            }
        }
        
    }
    
     func setCurrent(usernume:String , completion :@escaping (Bool,String)->Void){
        print("on setCurrent fn")
        docRef.collection("assignment")
            .whereField("current", isEqualTo: true)
            .whereField("client", isEqualTo: usernume)
            .getDocuments { querySnapshot, error in
                if let err = error {
                    completion(false,"Error updating document,setCurrent: \(err)")
                }
                if let documents = querySnapshot?.documents{
                    if documents.count > 0 {
                    for asg in documents{
                        print("doc id: \(asg.documentID)")
                        let ref = self.docRef.collection("assignment").document(asg.documentID)
                        ref.updateData(["current" : false]){ err in
                            if let err = err {
                                completion(false,"Error updating document,setCurrent: \(err)")
                            } else {
                                
                                completion(true,"Document successfully updated")
                            }
                        }
                    }
                    }else{
                        completion(true,"not found,setCurrent")
                    }
                }else{
                    completion(false,"error")
                }
            }
        
    }
    
}
