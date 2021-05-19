//
//  CheckboxView.swift
//  WatchYourMind
//
//  Created by Gatang on 1/3/2564 BE.
//

import SwiftUI

struct CheckboxView: View {

    let id: String
        let label: String
        let size: CGFloat
        let color: Color
        let textSize: Int
        let callback: (String, Bool)->()
        
        init(
            id: String,
            label:String,
            size: CGFloat = 30,
            color: Color = Color.black,
            textSize: Int = 40,
            callback: @escaping (String, Bool)->()
            )
        {
            self.id = id
            self.label = label
            self.size = size
            self.color = color
            self.textSize = textSize
            self.callback = callback
        }
        
        @State var isMarked:Bool = false
        
        var body: some View {
            Button(action:{
                self.isMarked.toggle()
                self.callback(self.id ,  self.isMarked)
            }) {
                HStack(alignment: .center, spacing: 10) {
                    Image(systemName: self.isMarked ? "checkmark.square" : "square")
                        .resizable()
                        .aspectRatio(CGSize(width: 30, height: 30),contentMode: .fill)
                        .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .frame(width: self.size, height: self.size)
                        .accentColor(.black)
                    
                    
                    
                    Text(label)
                        .font(Font.system(size: size))
                    Spacer()
                }.foregroundColor(Color.black)

            }
            .foregroundColor(Color.white)
        }

        
}

struct CheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxView(id: InternalFactor.DevelopmentalStress.rawValue,
                     label: InternalFactor.DevelopmentalStress.rawValue,
                     size: 20,
                     textSize: 20,
                     callback: checkboxSelected)
    }
}
