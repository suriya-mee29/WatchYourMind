//
//  CardUsename.swift
//  WatchYourMind
//
//  Created by Gatang on 20/3/2564 BE.
//

import SwiftUI


struct HomeUser: View {
    var imageuser: String
    var username: String
    var iconname: String
    var idusername: String
    var iconid: String
    var emailuser: String
    var iconemail: String
    var facultyuser:String
    var iconfaculty:String
    var branchuser:String
    var iconbranch:String

    
    
    
    var body: some View {
        
        VStack {
            HStack(alignment: .center) {
                Image(imageuser)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100, alignment: .center)
//                            .padding()
            }
            HStack{
//                VStack{
              
                    VStack(alignment: .leading){
                    HStack {
                        Image(systemName: iconname)
                        Text(username)
                            .font(.system(size: 20))
                            .font(.title)
                    }
                    HStack {
                        Image(iconid)
                        Text(idusername)
                    .font(.system(size: 20))
                            .font(.title)
                    }
                    HStack {
                        Image(systemName: iconemail)
                        Text(emailuser)

                    .font(.system(size: 20))
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(3)


                            .font(.title)
                    }
                    HStack {
                        Image(iconfaculty)
                        Text(facultyuser)
                    .font(.system(size: 20))
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(3)
                    }
                    HStack {
                        Image(iconbranch)
                        Text(branchuser)
                    .font(.system(size: 20))
                            .font(.title)
                    }
                    }//:VSTACK
                .padding(.trailing,20)
                    .frame(width:210)
                
                HStack(alignment: .center) {
                    ProgressBarView(value: CGFloat(60), color: Color.red,fontsize:10,circlelinewidth:5)
                    
                }
                .frame(width: 110, height: 110, alignment: .center)
            }//:HSTACK
            
            
            
            
        
            
        }//:VSTACK
        .padding(.vertical)
    }
}

struct CardUsename: View {
    


  
        public var stylecard: ChartStyle2
        public var dropShadowcard: Bool

        
        public init(style: ChartStyle2 = Styles.pieChartStyleOne, dropShadow: Bool? = true){
            self.stylecard = style

            self.dropShadowcard = dropShadow!
        }
        
        public var body: some View {
            ZStack{
                Rectangle()
                    .fill(self.stylecard.backgroundColor)
                    .cornerRadius(20)
                    .shadow(color: self.stylecard.dropShadowColor, radius: self.dropShadowcard ? 12 : 0)
                
                HomeUser(imageuser: "icon-girl",
                         username: "Tawiporn Tadkaew",
                         iconname: "person",
                         idusername: "6009650398",
                         iconid: "iconid",
                         emailuser: "tawiporn.tad@dome.tu.ac.th",
                         iconemail:"envelope",
                         facultyuser: "Scient and Technology",
                         iconfaculty:"iconfaculty",
                         branchuser:"Computer",
                         iconbranch: "iconbranch")
            }

            .frame(width: 500,height: 300)
            
        }
    

    }


struct CardUsename_Previews: PreviewProvider {
    static var previews: some View {
        CardUsename()
    }
}
