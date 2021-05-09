//
//  UploadFileContent.swift
//  WatchYourMind
//
//  Created by Gatang on 12/4/2564 BE.
//

import SwiftUI

struct UploadFileContent: View {
    @State var showImagePicker:Bool = false
    
     
    @Binding var selectedImage: Image?

    var body: some View {
        VStack {
          
            Button(action: {
                          self.showImagePicker.toggle()
                      }, label: {
                        VStack {
                            if selectedImage == nil{
                            Image(systemName: "icloud.and.arrow.up.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100, alignment: .center)
                            }else{
                                self.selectedImage?
                                    .resizable()
                                    .scaledToFit()
                            }
                                
                            
    
                            Text("Select Image")
                            
                        }
                      })
        }//:VStack
        .sheet(isPresented: $showImagePicker,
               content:{
                ImagePicker(image: self.$selectedImage)

               })
       
    }
}

struct UploadFileContent_Previews: PreviewProvider {
    static var previews: some View {
        UploadFileContent(selectedImage: .constant(Image("")))
    }
}
