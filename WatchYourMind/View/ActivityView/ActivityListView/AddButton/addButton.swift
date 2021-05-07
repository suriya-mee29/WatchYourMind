//
//  addButton.swift
//  WatchYourMind
//
//  Created by Gatang on 16/3/2564 BE.
//

import SwiftUI

struct addButton: View {
    @State private var willMoveToNextScreen = false

    @State private var isSelected = true
    @ObservedObject var arr : ManualActivtyViewModel = ManualActivtyViewModel()
    @State var showSheetView = false

    @State var activityData = ManualActivityModel(id: "", createby: "", title: "", description: "", createDate: Date(), type: "", imageicon: "", link: "", pic: "", outcome:[])
    
    @State var iSSave : Bool = false
    @State var isIphone: Bool = false
    
    var body: some View {
//        NavigationView {
//        VStack(alignment: .leading, spacing: 8){

//            NavigationLink(destination: NewActivityView(iSSave: .constant(false), activityData: .constant(ManualActivityModel(id: "", createby: "", title: "", description: "", createDate: Date(), type: "", imageicon: "", link: "", pic: "", outcome:[])), showSheetView: .constant(true))) {
                //                    Spacer()
        
            NavigationLink(destination:MeasurementView()){
                HStack{
                    
                    Image(systemName: "chevron.forward" )
//                        .font(.system(size: 35))
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20, alignment: .center
                        )
                    
                    
                    
                }//HSTACK
                .frame(width: 30, height: 30, alignment: .center)
                
                .background(Color.gray)
                
                .clipShape(Circle())
                .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
                .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
                
            }//:NavigationLink
            

//            .navigate(to: NewActivityView(iSSave: .constant(false), activityData: .constant(ManualActivityModel(id: "", createby: "", title: "", description: "", createDate: Date(), type: "", imageicon: "", link: "", pic: "", outcome:[])), showSheetView: .constant(true)), when: $willMoveToNextScreen)
            .navigate(to: MeasurementView(), when: $willMoveToNextScreen)
            
//        }//:VSatck
//        .navigationTitle("ActivityList")
        


        
    }
}

struct addButton_Previews: PreviewProvider {
    static var previews: some View {
        addButton()
    }
}
