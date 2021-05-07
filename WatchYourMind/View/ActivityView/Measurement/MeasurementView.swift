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
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]

    var body: some View {
        
//        NavigationView {
          Group {
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    VStack(alignment: .leading){
                        NavigationBarMeasurement()
                        HStack(alignment: .center) {
                            
                            VStack(alignment: .leading) {
                                Image("Avatar_white")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .padding(.horizontal,8)
                                    .clipShape(Circle())
                                    .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
                                    .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
                            }//:VSTACK
                        }
                        .padding(.bottom,10)
                        
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 0){
                                HStack {
                                    Text("Appointment:")
                                    ParentDatePicker()
                                }.padding(.bottom,3)
                                HStack {
                                    Text("Name TH:")
                                    
                                    Text("นายสุริยา มีขุนทด")
                                }.padding(.bottom,3)
                                HStack {
                                    Text("Name TH:")
                                    
                                    Text("MR. Suriya  Meekhunthod")
                                }.padding(.bottom,3)
                                HStack {
                                    Text("E-mail:")
                                    
                                    Text("Suriya.mee@dome.tu.ac.th")
                                }.padding(.bottom,3)
                                HStack {
                                    Text("Faculty:")
                                    
                                    Text("Scient and Technology")
                                }.padding(.bottom,3)
                                HStack {
                                    Text("Branch:")
                                    
                                    Text("Computer")
                                }
                                BottonSend()
                                
                                //                                .frame(width: 200, height: 100)
                            }//:VSTACK
                            
                        }
                        
                        
                        
                        
                        HStack{
                            VStack(alignment:.center) {
                                Text("ACTIVITY")
                                    .font(.system(size: 20))
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.gray)
                                //                        Divider()
                                //                    HStack {
                                //                            DatepickerView()
                                //                        .frame(width: 120, height: 10)
                                //                        Text("-")
                                //                            DatepickerView()
                                //                        .frame(width: 120, height: 10)
                                //                    }
                                //                  Spacer()
                            }//:VSTACK
                            Text("(10)")
                                .foregroundColor(.gray)
                        } //: HSTACK
                        .frame(width: UIScreen.Widthscreen,height: 100 )
                        
                        //        .background(Color("bg-2"))
                        ScrollView(.vertical, showsIndicators: false) {
                            ZStack {
                                
                                FlipMeasureView()
                                    .frame(width: UIScreen.Widthscreen, height: UIScreen.Height, alignment: .center)
                            }//:ZStack
                        }//:ScrollView
                        
                    }
                    
                    
                }
            }
            
          }          .navigationBarTitle("Measurement", displayMode: .large)

//        }
//        .navigationViewStyle(StackNavigationViewStyle())

        
       

        
    }
            
          
}

struct MeasurementView_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementView()
    }
}
//
