//
//  MeasurementView.swift
//  WatchYourMind
//
//  Created by Gatang on 16/3/2564 BE.
//

import SwiftUI
extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}
extension UIScreen{
   static let Widthscreen = UIScreen.main.bounds.size.width
   static let Heightscreen = UIScreen.main.bounds.size.height
   static let Sizescreen = UIScreen.main.bounds.size
}

struct MeasurementView: View {
    
    @EnvironmentObject var measurement: Measurement
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible())]

    var user: userRequest

    var body: some View {
        
        VStack {
//            ScrollView(.vertical, showsIndicators: false) {
//                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
//                Spacer()
    //                .padding(.top,100)
//                    .padding(.trailing,150)
                    
                
                    VStack{
                        NavigationBarMeasurement()

                            
                        HStack(alignment: .center) {
                            


                            VStack(alignment: .leading) {
                                Image("\(user.imageUser)")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .padding(.horizontal,8)
                                    .clipShape(Circle())
                                    .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
                                    .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
                            }//:VSTACK
                                                .padding(.bottom,10)
                        
                        
//                        HStack {
                            VStack(alignment: .leading, spacing: 0){
                                HStack {
                                    Text("Appointment:")
                                    ParentDatePicker()
                                }.padding(.bottom,3)
                                HStack {
                                    Text("Name TH:")
                                    
                                    Text("\(user.nameTH)")
                                }.padding(.bottom,3)
                                HStack {
                                    Text("Name EN:")
                                    
                                    Text("\(user.nameEN)")
                                }.padding(.bottom,3)
                                HStack {
                                    Text("E-mail:")
                                    
                                    Text("\(user.email)")
                                }.padding(.bottom,3)
                                HStack {
                                    Text("Faculty:")
                                    
                                    Text("\(user.faculty)")
                                }.padding(.bottom,3)
                                HStack {
                                    Text("Branch:")
                                    
                                    Text("\(user.branch)")
                                }
                                BottonSend()


                            }//:VSTACK

//                        }
                           

                            
                        }

                        
                        
                        
                        
                        HStack{
                            VStack(alignment:.center) {
                                Text("ACTIVITY")
                                    .font(.system(size: 20))
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.gray)
                            
                            }//:VSTACK
                            Text("(10)")
                                .foregroundColor(.gray)


                        } //: HSTACK
                        .frame(width: UIScreen.Widthscreen,height: 100 )
                        
                        //        .background(Color("bg-2"))
                        VStack(alignment:.leading){
                        ScrollView(.vertical, showsIndicators: false) {
                           
                        
                                FlipMeasureView()
                                    .frame(width: UIScreen.Widthscreen, height: UIScreen.Height, alignment: .center)
                            }//:ZStack
                            .padding()
//                        }//:ScrollView
                        
                        }//VSTACK
                    }
        }

          .edgesIgnoringSafeArea(.all)


    }
            
          
}

struct MeasurementView_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementView(user: userRequestData[1])
    }
}
//
