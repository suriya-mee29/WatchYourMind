//
//  NewActivityView.swift
//  WatchYourMind
//
//  Created by Gatang on 16/3/2564 BE.
//
import SwiftUI

struct NewActivityView: View {
    @Binding var iSSave : Bool
    @State private var text = ""
    @State private var fullText: String = ""
    @State  var selectedItems: [Items] = []
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible())]
    
    @Binding var activityData : ManualActivityModel
    @Binding var showSheetView : Bool
    @State var showImagePicker:Bool = false
    @State var selectedImage: Image? = Image("")
    let activitiseIcon :[ActivitiesIcon] = Bundle.main.decode("activitise_Icon.json")
    
    @State var selectedIcon : String = "gallery"
    
    @State var image_file : Image?
    @State var link_file : String = ""
    
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State var isLoading : Bool = false
    @State var showAlert : Bool = false
    @State var alertMessage : String = ""
    @State var headerMsg : String = ""
    
    
    @State var issave : Bool = false
    @State var newActivity : [String:Any]?
    
    var activityStore = ActivityStore()
    

    var body: some View {

          Group {
            ScrollView(.vertical, showsIndicators: false) {

                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    
        VStack(alignment: .leading, spacing: 8){
            Text("New Activity")
                .font(.system(size: 50))
                .font(.headline)
                .fontWeight(.bold)
                .padding(.bottom,10)
            
            HStack{
                
                Text("Activity Name")
                    .font(.system(size:30))
                    .foregroundColor(.black)
               
                
                TextField("Activity Name...", text: $text)
                         .textFieldStyle(RoundedBorderTextFieldStyle())
                         .frame(minHeight: CGFloat(30))
                    .shadow(radius: 3 )

                    
            }//:HSTACK
            .padding(.horizontal,8)
            .padding(.bottom,30)
            HStack{
                
                Text("Selected Icon Activity")
                    .font(.system(size:30))
                    .foregroundColor(.black)
                
                
                Button(action: {
                    self.showImagePicker.toggle()
                }, label: {
                    //                    Text("Select Image")
                    Image(self.selectedIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50, alignment: .center)
                        
                    
                })//:Button
                self.selectedImage?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: .center)
                //                    .shadow(radius: 3 )
                
                
            }//:HSTACK
            .sheet(isPresented: $showImagePicker,
                   content:{
                    ActivityIconGalleryView(selectedIcon: $selectedIcon, showImagePicker: $showImagePicker)
                    
                   })
            
            .padding(.horizontal,8)
            .padding(.bottom,30)

            
            Text("Explannation of Activity ")
                .font(.system(size:30))
                .foregroundColor(.black)
                
           
            TextEditor(text: $fullText)
                .font(.title)
                    .autocapitalization(.words)
                    .disableAutocorrection(true)
                
                
                .frame(height: 200)
                .cornerRadius(3)
                .background(Color.white)

                .onTapGesture {
                    hideKeyboard()
                }
                .shadow(radius: 5 )
                .padding(.horizontal,10)
                .padding(.bottom,30)
            
                Text("Attach an activity file/link")
                    .font(.system(size:30))
                    .foregroundColor(.black)
            ContentTabsView(photo_file: self.$image_file, link_file: self.$link_file)
                    .padding(.horizontal,8)
                    .padding(.bottom,30)


            Text("Outcome assign")
                .font(.system(size:30))
                .foregroundColor(.black)
            GridPicker( selectedItems: $selectedItems)
                .padding(.bottom,50)
       
        
        }
    }//:LazyGrid
                
                
                Button(action: {
                    print("btn")
                    if !text.isEmpty{
                        if selectedIcon != "gallery"{
                            if !fullText.isEmpty{
                                let userdefults = UserDefaults.standard
                                let username = userdefults.string(forKey: "CURRENT_USER")
                                
                                self.newActivity =
                                    [
                                        "title" : self.text ,
                                        "imageIcon" : self.selectedIcon,
                                        "description": self.fullText,
                                        "createdDate" : Date(),
                                        "createdby" : username!,
                                        "type" : "MANUAL"
                                        
                                    ]
                                
                                
                                //optional
                                
                                //attach file
                                if self.image_file != nil{
                                    //store image to file storage
                                    //save url to db
                                    self.activityStore.storePicture(data: (self.image_file?.ASUIImage().pngData())!) { success, path in
                                        
                                        if success {
                                            print("success")
                                            newActivity!["photoURL"] = path
                                            issave.toggle()
                                        }else{
                                            print("can not svaed")
                                            issave.toggle()
                                        }
                                    }
                                   
                                }else{
                                    issave.toggle()
                                    
                                }
                                
                                //outcome req
                                if self.selectedItems.count > 0{
                                    var outcomeReq = [String]()
                                    for i in 0...(self.selectedItems.count-1){
                                        outcomeReq.append(self.selectedItems[i].name)
                                    }
                                    newActivity!["outcomeReq"] = outcomeReq
                                }
                                
                                
                            }else{
                                self.headerMsg = "From invalide"
                                self.alertMessage = "Please explain your activity"
                                self.showAlert = true
                            }
                            
                        }else{
                            self.headerMsg = "From invalide"
                            self.alertMessage = "Please select an icon to represent your activity"
                            self.showAlert = true
                        }
                        
                        
                    }else{
                        self.headerMsg = "From invalide"
                        self.alertMessage = "Plese define the activity name"
                        self.showAlert = true
                    }
                    
                  
                }, label: {
                    HStack {
                        Text("save")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.white)
                    }
                    .frame(width: 100)
                })
                .padding(.horizontal,10)
                .background(Color("IconTabBar"))
                .clipShape(Capsule())

        }
          }
          .alert(isPresented: $showAlert , content: {
            Alert(title: Text(self.headerMsg.uppercased()), message: Text("\(self.alertMessage)"), dismissButton: .default(Text("OK!")))
                      }
          )
          .onChange(of: self.issave , perform: { value in
            if newActivity != nil {
                print(self.newActivity!)
                print("to setResults")
                self.activityStore.setResults(result: self.newActivity!) { success, msg in
                    if success {
                        print("saved.......")
                        self.iSSave = true
                        self.showSheetView = false
                        
                    }else{
                        
                    }
                }
            }
            
          })
          .navigationBarTitle("New Activity", displayMode: .large)
          .navigationBarItems(trailing: Button(action: {
              print("Dismissing sheet view...")
              self.showSheetView = false
          }) {
              Text("Done").bold()
          })
          .padding()
        
        
  
        
    }
}

struct NewActivityView_Previews: PreviewProvider {
    static var previews: some View {
        NewActivityView(iSSave: .constant(false), activityData: .constant(ManualActivityModel(id: "", createby: "", title: "", description: "", createDate: Date(), type: "", imageicon: "", link: "", pic: "", outcome:[])), showSheetView: .constant(true))
//            .previewDevice("iPad Pro (12.9-inch) (4th generation)")
    }
}



