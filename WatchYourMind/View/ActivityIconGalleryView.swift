//
//  ActivityIconGalleryView.swift
//  WatchYourMind
//
//  Created by Suriya on 8/5/2564 BE.
//

import SwiftUI

struct ActivityIconGalleryView: View {
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    let activitiseIcon :[ActivitiesIcon] = Bundle.main.decode("activitise_Icon.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var gridColum : Double = 3.0
    @Binding var selectedIcon : String
    @Binding var showImagePicker : Bool
    
    func gridSwitch(){
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridColum))
        
    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
            ForEach(activitiseIcon) { item in
                Image(item.iconName)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .onTapGesture {
                        selectedIcon = item.iconName
                        //selectedAnimal = item.image
                        haptics.impactOccurred()
                        showImagePicker = false
                    }
                   
            }//LOOP
            }//GRID
           
            .onAppear(perform: {
            gridSwitch()
             })
            
            }//VSTACK

        }//SCROLL
        
        
        
    }
}

struct ActivityIconGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIconGalleryView(selectedIcon: .constant(""), showImagePicker: .constant(true))
    }
}
