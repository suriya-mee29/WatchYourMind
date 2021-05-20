//
//  StatusView.swift
//  WatchYourMind
//
//  Created by Gatang on 24/2/2564 BE.
//

import SwiftUI

struct StatusView: View {
    //MARK: - Prorerties
    let statusTitle : String
    let iconName : String
    let statusLabel : String
    let count_status : String
    let bg_image : String
    @State var isExpanded = false
    var body: some View {
        
        HStack(alignment: .center, spacing: 16) {
            HStack{
            Image(iconName)
                .resizable()
                .scaledToFill()
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .padding(.vertical, 9)
                .padding(.horizontal, 10)
                //.background(Color(bg_image))
                .background(LinearGradient(gradient: Gradient(colors:[Color(bg_image)]), startPoint: .top, endPoint: .bottom))
                .clipShape(
                    RoundedRectangle(cornerRadius: 9))
                .shadow(radius: 5)
            }
            .padding(.leading)
            VStack(alignment: .leading, spacing: 8) {
                Text(statusTitle)
                    .font(.system(size: 25))

                    .fontWeight(.heavy)

                    //.font(.title)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                  //.font(.title)
                    .foregroundColor(.black)
                //
                HStack {
                    Text(count_status)
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        //.padding(.horizontal,7)
                        .foregroundColor(.black)
//                        .padding(.trailing)
                    Text(statusLabel)
                        .font(.system(size: 20))
                        .font(.title)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(.black)
                        .padding(.leading,10)

                    
                    
                }
                //.shadow(radius: 10 )
                
            } //: VSTACK
            
            ZStack{
            Button(action: {
               
                isExpanded.toggle()
                    
                
            }){
                Image(systemName:"chevron.forward")
                    .foregroundColor(.gray)
                    .padding(.trailing,20)
            }
            if isExpanded {
                Image(systemName:"chevron.down")
                    .foregroundColor(.gray)
                    .padding(.trailing,20)
            }
            }
            
           
        } //: HSTACK
        .frame(width:330, height: 100)
        
        //.padding(.horizontal,15)
        .padding(.vertical,10)
        .background(Color("bg-1"))
     
        .cornerRadius(3.0)
        
        
        .clipShape(RoundedRectangle(cornerRadius: 5))
        
        
    }
}
//

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView(statusTitle: "Seed".uppercased(), iconName: "seed", statusLabel: "Client have seed", count_status: "21",bg_image: "seedColor")
            .padding(.horizontal,4)

            .previewLayout(.sizeThatFits)
        
    }
}
