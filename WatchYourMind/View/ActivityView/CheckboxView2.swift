//
//  CheckboxView2.swift
//  WatchYourMind
//
//  Created by Gatang on 1/3/2564 BE.
//

import SwiftUI

enum InternalFactor: String {
    case DevelopmentalStress = "Developmental Stress"
    case BiologyStress = "Biology Stress"
    case EnvironmentalStress = "Environmental stress"
    case StressFromPerception = "Stress from perception"
}

struct CheckboxView2: View {
    @Binding var precipitance : [String : [String:Bool]]
    
    @State var external : [String : Bool] = [
        "stress from perception" : false ,
        "enviromental stress" : false]
    
    @State var Internal : [String : Bool] = [
            "developmental stress" : false ,
            "biology Stress" : false]
 
    
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0){
//            Text("Internal Factor")
//                .font(Font.headline)
            VStack(alignment: .leading , spacing:3){
                Text("Internal Factor")
                    .font(.system(size: 25))
                    .font(Font.headline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                CheckboxView(
                    id: InternalFactor.DevelopmentalStress.rawValue,
                    label: InternalFactor.DevelopmentalStress.rawValue,
                    size: 20,
                    textSize: 20,
                    callback: checkboxSelected
                )
                CheckboxView(
                    id: InternalFactor.BiologyStress.rawValue,
                    label: InternalFactor.BiologyStress.rawValue,
                    size: 20,
                    textSize: 20,
                    callback: checkboxSelected
                )
            }//:VSTACK
        .padding(.horizontal,10)
        .foregroundColor(.black)
//        .padding()
            
            
//            Divider()
            VStack(alignment: .leading, spacing: 3){
                    Text("External Factor")
                        .font(.system(size: 25))
                        .font(Font.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    CheckboxView(
                        id: InternalFactor.StressFromPerception.rawValue,
                        label: InternalFactor.StressFromPerception.rawValue,
                        size: 20,
                        textSize: 20,
                        callback: checkboxSelected
                    )
                    CheckboxView(
                        id: InternalFactor.EnvironmentalStress.rawValue,
                        label: InternalFactor.DevelopmentalStress.rawValue,
                        size: 20,
                        textSize: 20,
                        callback: checkboxSelected
                    )
                }//:VSTACK
            .foregroundColor(.black)
//            .padding()
                
              
            }//:HSTACK
           
          
//        }//:HSTACK
        .foregroundColor(.gray)
//        .padding()
            
    }
    
    func checkboxSelected(id: String, isMarked: Bool) {
        print("\(id) is marked: \(isMarked)")
        switch id {
        case InternalFactor.DevelopmentalStress.rawValue :
            if isMarked {
                self.Internal["developmental stress"] = true
            }else{
                self.Internal["developmental stress"] = false
            }
        case InternalFactor.BiologyStress.rawValue :
            if isMarked {
                self.Internal["biology Stress"] = true
            }else{
                self.Internal["biology Stress"] = false
            }
        case InternalFactor.StressFromPerception.rawValue :
            if isMarked {
            self.external["stress from perception"] = true
           }else{
            self.external["stress from perception"] = false
           }
        case InternalFactor.EnvironmentalStress.rawValue :
              if isMarked {
                self.external["enviromental stress"] = true
               }else{
                self.external["enviromental stress"] = false
               }
        default:
            print("defauts of checkboxView2()")
            
        }
        
        self.precipitance["external"] = self.external
        self.precipitance["internal"] = self.Internal
    }
}

struct CheckboxView2_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxView2(precipitance: .constant(["ddd" : ["String" : false]]))
    }
}
