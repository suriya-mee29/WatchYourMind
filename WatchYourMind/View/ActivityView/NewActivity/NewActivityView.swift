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
                    Image(systemName: "photo")
                })//:Button
                self.selectedImage?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: .center)
                //                    .shadow(radius: 3 )
                
                
            }//:HSTACK
            .sheet(isPresented: $showImagePicker,
                   content:{
                    ImagePicker(image: self.$selectedImage)
                    
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
                ContentTabsView()
                    .padding(.horizontal,8)
                    .padding(.bottom,30)


            Text("Outcome assign")
                .font(.system(size:30))
                .foregroundColor(.black)
            GridPicker( selectedItems: $selectedItems)
       
        
        }
    }//:LazyGrid
                
                
                Button(action: {
                    var strArr : [String] = []
                    if selectedItems.count > 0 {
                    for i in 0...(selectedItems.count - 1) {
                        strArr.append(self.selectedItems[1].name)
                    }
                    }
                    
                    let data = ManualActivityModel(id: UUID().uuidString, createby: "admin", title: text, description: fullText, createDate: Date(), type: "MANUAL", imageicon: "", link: "", pic: "", outcome: strArr)
                    self.activityData = data
                    self.iSSave = true
                    self.showSheetView = false
                }, label: {
                    Text("save")
                })
                .disabled(text.isEmpty || fullText.isEmpty)

        }
          }
          .navigationBarTitle("New Activity", displayMode: .large)
          .navigationBarItems(trailing: Button(action: {
              print("Dismissing sheet view...")
              self.showSheetView = false
          }) {
              Text("Done").bold()
          })
  
        
    }
}

struct NewActivityView_Previews: PreviewProvider {
    static var previews: some View {
        NewActivityView(iSSave: .constant(false), activityData: .constant(ManualActivityModel(id: "", createby: "", title: "", description: "", createDate: Date(), type: "", imageicon: "", link: "", pic: "", outcome:[])), showSheetView: .constant(true))
//            .previewDevice("iPad Pro (12.9-inch) (4th generation)")
    }
}



