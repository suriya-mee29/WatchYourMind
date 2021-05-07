//
//  EmotionLevelGroup.swift
//  WatchYourMind
//
//  Created by Gatang on 4/3/2564 BE.
//

import SwiftUI

enum Mood: String{
    case noHurt = "😆"
    case hurtsLittlebit = "😀"
    case hurtsLittlemore = "🙂"
    case hurtsEvenmore = "🙁"
    case hurtsWholelot = "😔"
    case hurtsWrost = "😠"
}


struct EmotionLevelGroup: View {
    let call: (String) -> ()
    @State var selected: String = ""
    
    
    

    var body: some View {
        HStack(alignment: .center){
            radionoHurt
            radiohurtsLittlebit
            radiohurtsLittlemore
            radiohurtsEvenmore
            radiohurtsWholelot
            radiohurtsWrost
        }
    }
    
    var radionoHurt: some View{
        HStack{
            EmotionRadioField(
                id: Mood.noHurt.rawValue,
                label: Mood.noHurt.rawValue,
                isMarked: selected == Mood.noHurt.rawValue ? true : false ,
                callback: radioCallback
        )
        }
    }
    
    var radiohurtsLittlebit: some View{
        HStack{
            EmotionRadioField(
                id: Mood.hurtsLittlebit.rawValue,
                label: Mood.hurtsLittlebit.rawValue,
                isMarked: selected == Mood.hurtsLittlebit.rawValue ? true : false ,
                callback: radioCallback
            )
        }
    }
    
    var radiohurtsLittlemore: some View{
        HStack{
            EmotionRadioField(
                id: Mood.hurtsLittlemore.rawValue,
                label: Mood.hurtsLittlemore.rawValue,
                isMarked: selected == Mood.hurtsLittlemore.rawValue ? true : false ,
                callback: radioCallback
        )
        }
    }
    
    var radiohurtsEvenmore: some View{
        HStack{
            EmotionRadioField(
                id: Mood.hurtsEvenmore.rawValue,
                label: Mood.hurtsEvenmore.rawValue,
                isMarked: selected == Mood.hurtsEvenmore.rawValue ? true : false ,
                callback: radioCallback
        )
        }
    }

    var radiohurtsWholelot: some View{
        HStack{
            EmotionRadioField(
                id: Mood.hurtsWholelot.rawValue,
                label: Mood.hurtsWholelot.rawValue,
                isMarked: selected == Mood.hurtsWholelot.rawValue ? true : false ,
                callback: radioCallback
        )
        }
    }
    
    var radiohurtsWrost: some View{
        HStack{
            EmotionRadioField(
                id: Mood.hurtsWrost.rawValue,
                label: Mood.hurtsWrost.rawValue,
                isMarked: selected == Mood.hurtsWrost.rawValue ? true : false ,
                callback: radioCallback
        )
        }
    }
    
    func radioCallback(id: String) {
        selected = id
        call(id)
        
    }
    
}

