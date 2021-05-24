//
//  CardUser.swift
//  WatchYourMind
//
//  Created by Gatang on 21/3/2564 BE.
//

import SwiftUI

struct CardModleUser: View {
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
          var statususer:String
          var statuscolor: Color
    var body: some View {
//        ScrollView(.vertical, showsIndicators: false) {
//          LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
            
            VStack {
//                HStack(alignment: .center, spacing: 8){
                    VStack {
                        HStack {
                            Image(imageuser)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80,height:80)
                            VStack(alignment:.leading){
                                Text(username)
                                    .font(.system(size:20))
                                    .fontWeight(.semibold)
                                
                                Text(idusername)
                                    .font(.system(size:15))
                                    .fontWeight(.semibold)

                                
                                Text(statususer)
                                    .font(.system(size:30))
                                    .fontWeight(.semibold)
                                    .foregroundColor(statuscolor)
                            }//:VSTACK
                          
                            
                        }//:HSTACK
                        VStack(alignment:.leading){
                            HStack {
                                Image(systemName: iconemail)
                                    .font(.system(size:20))
                                Text(emailuser)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .lineLimit(2)
                            }
                            .padding(.leading,30)
                            .padding(.bottom,2)
                            
                            HStack {
                                Image(iconfaculty)
                                    .font(.system(size:20))
                                Text(facultyuser)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .lineLimit(2)
                            }
                            .padding(.leading,30)
                            .padding(.bottom,2)
                            
                            HStack {
                                Image(iconbranch)
                                    .font(.system(size:20))
                                Text(branchuser)
                                    .lineLimit(2)
                            }
                            .padding(.leading,30)
                            .padding(.bottom,2)

                        }
                        
                    }//:VSTACK
                    .padding()
                    .cornerRadius(20)
//                }//:HSTACK
            }//:VStack
            
            
//          }//:LazyVGrid
//        }//:ScrollView
      
    }
}


struct CardUser: View {
    public var stylecard: ChartStyle2
    public var dropShadowcard: Bool

    
    public init(style: ChartStyle2 = Styles.pieChartStyleOne, dropShadow: Bool? = true){
        self.stylecard = style

        self.dropShadowcard = dropShadow!
    }
    var body: some View {
        ZStack{
            Rectangle()
                .fill(self.stylecard.backgroundColor)
                .cornerRadius(10)
                .shadow(color: self.stylecard.dropShadowColor, radius: self.dropShadowcard ? 12 : 0)
            
            CardModleUser(imageuser: "icon-girl",
                          username: "Tawiporn Tadkaew",
                          iconname: "person",
                          idusername: "6009650398",
                          iconid: "iconid",
                          emailuser: "tawiporn.tad@dome.tu.ac.th",
                          iconemail:"envelope",
                          facultyuser: "Scient and Technology",
                          iconfaculty:"iconfaculty",
                          branchuser:"Computer",
                          iconbranch: "iconbranch",
                          statususer:"Tree", statuscolor: Color("treeColor"))
        }
        .frame(width:500,height: 320)
        
    }
}

struct CardUser_Previews: PreviewProvider {
    static var previews: some View {
        CardUser()
    }
}
