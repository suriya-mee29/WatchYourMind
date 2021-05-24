//
//  RingGraphView.swift
//  WatchMyMind
//
//  Created by Suriya on 2/2/2564 BE.
//

import SwiftUI

struct ProgressBarView: View {
    // MARK: - PROPERTIES
    
   @State var progess : CGFloat = 0
    let value : CGFloat
    let color : Color
    let fontsize : CGFloat
    let circlelinewidth: CGFloat
    
    
    // MARK: - BODY
    var body: some View {
    
        ZStack {
            Text("\(Int(value))%")
                .font(.system(size: fontsize))
                .foregroundColor(color)
                .fontWeight(.bold)
                .font(.body)
                .onChange(of: value, perform: { value in
                    withAnimation(Animation.easeIn(duration: 0.1)){
                        progess = value
                    }
                })
            Circle()
                .trim(from: 0, to: 1 )
                .stroke(style: StrokeStyle(lineWidth: circlelinewidth, lineCap: .round))
                .foregroundColor(Color.gray.opacity(0.1))
                
                //.foregroundColor(color.opacity(0.09))
            
            Circle()
                
                .trim(from: 0, to: progess / 100 )
                .stroke(style: StrokeStyle(lineWidth: circlelinewidth, lineCap: .round))
                .foregroundColor(color)
                .onAppear(perform: {
                    withAnimation(Animation.easeIn(duration: 0.7)){
                        progess = value
                    }
                })
                
                
                
        }
//        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
    }
}


    // MARK: -PREVIEW
struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(value: CGFloat(60), color: Color.red,fontsize:10,circlelinewidth:5)
//            .previewLayout(.sizeThatFits)
            .padding()
    }
}
