//
//  SearchView2.swift
//  WatchYourMind
//
//  Created by Gatang on 29/3/2564 BE.
//

import SwiftUI


struct SearchView2: View {
    @EnvironmentObject var shop: Shop

    private var user = [userRequest(imageUser: "image1", nameTH: "นางสาวทวิพร ทัดแก้ว", nameEN: "Tawiporn Tadkaew", email: "Tawiporn.tad@dome.tu.ac.th", faculty: "คณะวิทยาศาสตร์และเทคโนโลยี", branch: "คอมพิวเตอร์", progress: 50, progressColor: "saplingColor", dateEndup: "24-04-2021", dateAssign: "10-14-2021", status: "Sapling"),
        userRequest(imageUser: "image2",nameTH: "นายพัชรจักขุ์ ยงวัฒนา",nameEN: "Mr.Patcharajak Yongwatthana", email: "Patcharajak.yon@dome.tu.ac.th",faculty:"Science and Technology",branch: "คอมพิวเตอร์",progress: 19, progressColor:"seedColor",dateEndup:"07-04-2021",dateAssign: "17-04-2021",status: "Seed"),
        userRequest(imageUser: "image3",nameTH: "นายสุริยา มีขุนทด",nameEN: "Mr.Suriya Meekhuntod",email: "Suriya.mee@dome.tu.ac.th",faculty:"Science and Technology",branch: "คอมพิวเตอร์",progress: 100,progressColor:"bloomingColor",dateEndup:"03-04-2021",dateAssign: "15-04-2021",status: "Blooming"
        )
    ]
//    @State var showSheetView = false
    @State var iSSave : Bool = false
    @State var activityData = ManualActivityModel(id: "", createby: "", title: "", description: "", createDate: Date(), type: "", imageicon: "", link: "", pic: "", outcome:[])

    
       @State private var searchText = ""
       @State private var showCancelButton: Bool = false
    @State var showSheetManualActivityList = false
    @ObservedObject var arr : ManualActivtyViewModel = ManualActivtyViewModel()

    
       var body: some View {

//           NavigationView {
        VStack(alignment: .leading, spacing: 5, content: {
            // Search view
            NavigationBarDetailView()
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    
                    TextField("search", text: $searchText, onEditingChanged: { isEditing in
                        self.showCancelButton = true
                    }, onCommit: {
                        print("onCommit")
                    }).foregroundColor(.primary)
                    
                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)
                
                if showCancelButton  {
                    Button("Cancel") {
                        UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                        self.searchText = ""
                        self.showCancelButton = false
                    }
                    .foregroundColor(Color(.systemBlue))
                }
            }
            .padding(.horizontal)
            .navigationBarHidden(showCancelButton)
            
            
            List(user.filter({ searchText.isEmpty ? true : $0.nameTH.contains(searchText)||$0.nameEN.contains(searchText)||$0.faculty.contains(searchText)||$0.branch.contains(searchText)||$0.status.contains(searchText) })) { item in
                HStack{
                    Image("\(item.imageUser)")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .clipShape(Circle())
                        .frame(width:80, height: 80)
                        .padding()
                    
                    VStack(alignment:.leading){

//
                        HStack{
                            Text("NameTH:")
                                .foregroundColor(.gray)

                        Text("\(item.nameTH)").fontWeight(.semibold)
                        }.padding(.vertical,0.5)
                        
                        HStack{
                            Text("NameEN:")
                                .foregroundColor(.gray)

                        Text("\(item.nameEN)")
                            .fontWeight(.semibold)
                        }.padding(.vertical,0.5)
////                        HStack-Name
                        HStack{
                            Text("Faculty:")
                                .foregroundColor(.gray)
                                
                            Text("\(item.faculty)")
                                .fontWeight(.semibold)                        }//:HSTACK-FACTORY
                        .padding(.vertical,0.5)
                        HStack{
                            Text("Branch:")
                                .foregroundColor(.gray)
                               
                            Text("\(item.branch)")
                                .fontWeight(.semibold)                        }//:HSTACK-branch
                        .padding(.vertical,0.5)
                        HStack{
                            Text("Email:")
                                .foregroundColor(.gray)
                            Text("\(item.email)")
                                .fontWeight(.bold)
                        }//:HSTACK-Assign
                        .padding(.vertical,0.5)
                }//:VSTACK
                    Divider()
                        .frame(height:120)
                        .padding(.horizontal,50)
                    
                    VStack{
                        ProgressBarView(value: CGFloat(item.progress), color: Color("\(item.progressColor)"),fontsize:18,circlelinewidth:10)
                            .frame(width: 90, height: 90)
                        HStack{
                        Text("Status:")
                        Text("\(item.status)")
                        }//:HSTACK-Status

                        
                    }//:VSTACK
                    Spacer()
                    Button(action: {
                        self.showSheetManualActivityList.toggle()
                        print("ReAssignActivity")
                    },label : {
                        
                        ZStack {
                           
                            RoundedRectangle(cornerRadius: 5)
                                
                                .frame(height:50)
                                .foregroundColor(.purple)
                                .frame(width: 160, alignment: .center)
                            HStack{
                                
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                            Text("ReActivity")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                            
                        }//:HSTACK
                            
                            
                        }//:ZSATCK
//                        .onTapGesture {
//                          feedback.impactOccurred()
//                        preactivity.showingProduct = true
//                        }
                        
                        
                    })
                    
               
                }//:HSTACK
                .padding(.vertical,20)
            }//:List
            .sheet(isPresented: $showSheetManualActivityList) {
                ManualActivityList2()
            }
            
            
//            .sheet(isPresented: $showSheetView) {
//                NewActivityView(iSSave: $iSSave, activityData: $activityData, showSheetView: $showSheetView )
//            }
//            .onChange(of: showSheetView, perform: { value in
//                if iSSave  {
//                    arr.AddActivity(manualActivityModel: activityData)
//                iSSave = false
//                }
//            })
        
        })//:VSTACK
        .edgesIgnoringSafeArea(.all)

                   .resignKeyboardOnDragGesture()

        
        .background(Color("bg-3"))
        .zIndex(0)
        .ignoresSafeArea(.all, edges: .all)

       }
   }



   struct SearchView2_Previews: PreviewProvider {

       static var previews: some View {
        SearchView2()
            .environmentObject(Shop())
//            .environmentObject(Measurement())

       }
   }

   extension UIApplication {
       func endEditing(_ force: Bool) {
           self.windows
               .filter{$0.isKeyWindow}
               .first?
               .endEditing(force)
       }
   }

   struct ResignKeyboardOnDragGesture2: ViewModifier {
       var gesture = DragGesture().onChanged{_ in
           UIApplication.shared.endEditing(true)
       }
       func body(content: Content) -> some View {
           content.gesture(gesture)
       }
   }

   extension View {
       func resignKeyboardOnDragGesture2() -> some View {
           return modifier(ResignKeyboardOnDragGesture())
       }
   }
