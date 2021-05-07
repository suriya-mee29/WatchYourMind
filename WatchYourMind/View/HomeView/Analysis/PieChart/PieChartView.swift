//
//  PieChartView.swift
//  WatchYourMind
//
//  Created by Gatang on 20/3/2564 BE.
//

import SwiftUI




struct HomePiechart: View {
    var body: some View {
        
        HStack {
            GeometryReader{g in
                ZStack{
                    ForEach(0..<data.count){ item in
                        
                        DrawShape(center: CGPoint(x: g.frame(in: .global).width/2,y: g.frame(in: .global).height/2), index: item)
                        
                    }
                }
                
            }
            .frame(width: 150, height: 150, alignment: .center)

            .clipShape(Circle())
            .shadow(radius: 8)
            .padding(.trailing)
            VStack{
                ForEach(data){ item in
                VStack{
                    Text(item.name)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
//                        .frame(width:100)
//                    GeometryReader{g in
                        HStack{
//                            Spacer(minLength: 0)
                            Rectangle().fill (item.color)
                                .frame(width:30,height: 10)
                            Text(String(format: "\(item.percent)"))
                                .fontWeight(.bold)
//                                .padding()
                        }
//                        .padding()

//                    }
                }
                    
            }
            }
            
        }//:HSTACK
    }

}

struct DrawShape: View{
    var center: CGPoint
    var index: Int
//    @frozen struct Angle
    var body: some View{
        Path{ path in
            path.move(to: self.center)
            path.addArc(center: self.center, radius: 180, startAngle: .init(degrees: self.from()), endAngle:.init(degrees: self.to()), clockwise: false)
            
        }
        .fill(data[index].color)
        
    }
    
    func from()-> Double{
        if index == 0{
            return 0
        }else{
        var temp: Double = 0
        for i in 0...index-1{
            temp += Double(data[i].percent/100)*360
        }
        return temp
        }
    }
    
    func to() ->Double{
        var temp: Double = 0
        for i in 0...index{
            temp += Double(data[i].percent/100)*360
        }
        return temp
    }
    
}

//sample data

struct Pie: Identifiable{
    var id: Int
    var percent: CGFloat
    var name: String
    var color: Color
}
var data = [
    Pie(id: 0, percent: 60, name: "Complete", color: Color("completeColor")),
    Pie(id: 1, percent: 40, name: "Incomplete", color: Color("incompleteColor"))


]

public struct PieChartView : View {

    public var style: ChartStyle2
    public var dropShadow: Bool

    
    public init(style: ChartStyle2 = Styles.pieChartStyleOne, dropShadow: Bool? = true){
        self.style = style

        self.dropShadow = dropShadow!
    }
    
    public var body: some View {
        ZStack{
            Rectangle()
                .fill(self.style.backgroundColor)
                .cornerRadius(20)
                .shadow(color: self.style.dropShadowColor, radius: self.dropShadow ? 12 : 0)
            
            HomePiechart()
        }

        .frame(width:380,height: 220)    }
}

struct PieChartView_Previews : PreviewProvider {
    static var previews: some View {
        PieChartView()
    }
}
