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
    var body: some View {
        
        HStack(alignment: .center){
//            Text("Internal Factor")
//                .font(Font.headline)
            VStack(alignment: .leading , spacing:3){
                Text("Internal Factor")
                    .font(.system(size: 30))
                    .font(Font.headline)
                    .fontWeight(.semibold)
                CheckboxView(
                    id: InternalFactor.DevelopmentalStress.rawValue,
                    label: InternalFactor.DevelopmentalStress.rawValue,
                    size: 30,
                    textSize: 30,
                    callback: checkboxSelected
                )
                
                CheckboxView(
                    id: InternalFactor.BiologyStress.rawValue,
                    label: InternalFactor.BiologyStress.rawValue,
                    size: 30,
                    textSize: 30,
                    callback: checkboxSelected
                )
            }//:VSTACK
        .padding(.horizontal,20)
        .foregroundColor(.black)
//        .padding()
            
            
//            Divider()
            VStack(alignment: .leading, spacing: 3){
                    Text("External Factor")
                        .font(.system(size: 30))
                        .font(Font.headline)
                        .fontWeight(.semibold)
                    CheckboxView(
                        id: InternalFactor.StressFromPerception.rawValue,
                        label: InternalFactor.StressFromPerception.rawValue,
                        size: 30,
                        textSize: 30,
                        callback: checkboxSelected
                    )
                    CheckboxView(
                        id: InternalFactor.EnvironmentalStress.rawValue,
                        label: InternalFactor.EnvironmentalStress.rawValue,
                        size: 30,
                        textSize: 30,
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
    }
}

struct CheckboxView2_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxView2()
    }
}
