//
//  UploadFileContent.swift
//  WatchYourMind
//
//  Created by Gatang on 12/4/2564 BE.
//

import SwiftUI

struct UploadFileContent: View {
    @State var showImagePicker:Bool = false
     
    @State var selectedImage: Image? = Image("")

    var body: some View {
        VStack {
          
            self.selectedImage?
                .resizable()
                .scaledToFit()
            
            Button(action: {
                          self.showImagePicker.toggle()
                      }, label: {
                          Text("Select Image")
                      })//:Button
//            Button(action: {
//                //:Convert Image to base64
//
//                let uiImage: UIImage = self.selectedImage.asUIImage()
//                let imageData: Data = uiImage.jpegData(compressionQuality: 0.1) ?? Data()
//                let imageStr: String = imageData.base64EncodedString()
//
//                //Send Request to server
////                let urlString = "www.google.com"
////                let url = URL(string: urlString)
//                guard let url: URL = URL(string: "www.google.com") else{
//                    print("invalid URL")
//                    return
//
//                }
//                //:create parameter
//                let paramStr: String = "image=\(imageStr)"
//                let paramData: Data = paramStr.data(using: .utf8) ?? Data()
//
//                var urlRequest: URLRequest = URLRequest(url: url)
//                urlRequest.httpMethod = "POST"
//                urlRequest.httpBody = paramData
//
//                urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//
//                //send the request
//                URLSession.shared.dataTask(with: urlRequest,completionHandler: {
//                    (data,resounse,error) in
//                    guard let data = data else {
//                        print("invalid data")
//                        return
//                    }
//                    //show response n string
//                    let responseStr: String = String(data: data, encoding: .utf8) ?? ""
//                    print(responseStr)
//                })// URLSession
//                .resume()
//            }, label: {
//                Text("Upload Image")
//            })
        }//:VStack
        .sheet(isPresented: $showImagePicker,
               content:{
                ImagePicker(image: self.$selectedImage)

               })
       
    }
}

struct UploadFileContent_Previews: PreviewProvider {
    static var previews: some View {
        UploadFileContent()
    }
}
