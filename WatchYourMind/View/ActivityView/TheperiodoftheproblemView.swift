//
//  TheperiodoftheproblemView.swift
//  WatchYourMind
//
//  Created by Gatang on 2/3/2564 BE.
//

import SwiftUI

enum PROBLEM_MODE : String{
    case DAY = "Day(s)"
    case WEEK = "Week(s)"
    case MONTH = "Month(s)"
    
}
struct TheperiodoftheproblemView: View {
    @State var text: String = ""
    @State var expand = false
    @State var selectedLabel = "Selected"
    
    
    var body: some View {
       
            VStack{
//                VStack {
                HStack{
                                    Text("Have a problem: ")
                                        .font(.system(size: 20))
                                    TextFieldView()
                                        .shadow(radius: 5)
                                        .textContentType(.oneTimeCode)
                                           .keyboardType(.numberPad)
                                        .frame(width:90, height: 50)
                                        .fixedSize()
    

                                        Text(self.selectedLabel)
                                            .font(.system(size: 20))
                                   
                                    Image(systemName: expand ? "chevron.left" : "chevron.right")
                                        .resizable()
                                        .frame(width: 10, height: 20)
                                    .onTapGesture {
                                        self.expand.toggle()
                                    }
                                    
                                    VStack {
                                        VStack(alignment: .leading, spacing: 0){
                                        if expand{
                                                Button(action: {
                                                    print("1")
                                                    self.expand.toggle()
                                                    self.selectedLabel = "Day(s)"
                                                   
                                                        
                                                    })//:BUTTON
                                                {
                                                    Text("\(PROBLEM_MODE.DAY.rawValue)")
                                                    .padding()
                                                    
                                                }.foregroundColor(.black)

                                            Button(action: {
                                                print("2")
                                                self.expand.toggle()
                                                self.selectedLabel = "Week(s)"
                                                    
                                                })//:BUTTON
                                            {
                                            Text("\(PROBLEM_MODE.WEEK.rawValue)")
                                                .padding()
                                            }.foregroundColor(.black)
                                            

                                            Button(action: {
                                                print("3")
                                                self.expand.toggle()
                                                self.selectedLabel = "Month(s)"
                                                    
                                                })//:BUTTON
                                            {
                                                Text("\(PROBLEM_MODE.MONTH.rawValue)")
                                                .padding()
                                            }.foregroundColor(.black)

                                        }//:if
                                        }
                                    }
                    Spacer()
                }
               
//            }
        }//:HStack
        


}

}

struct TheperiodoftheproblemView_Previews: PreviewProvider {
    static var previews: some View {
        TheperiodoftheproblemView()
    }
}
