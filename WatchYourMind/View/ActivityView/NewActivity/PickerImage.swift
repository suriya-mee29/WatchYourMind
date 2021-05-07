//
//  PickerImage.swift
//  WatchYourMind
//
//  Created by Gatang on 20/4/2564 BE.
//

import SwiftUI

struct PickerImage: View {
    @State var isShowingImagePicker:Bool = false
    var body: some View {
        VStack {
            Image(uiImage: UIImage())
                .frame(width:200,height: 200)
                .border(Color.black,width: 1)
            
         
            
            Button(action: {
                self.isShowingImagePicker.toggle()
                print("show image picker")
            }, label: {
               Text("selected image")
                .font(.system(size: 32))
            })
            .sheet(isPresented: $isShowingImagePicker, content: {
//                Text("this is the image picker")
                ImagePickerView()
                //                HStack{
//                    Image("image1")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width:200,height: 200)
//                        .border(Color.black,width: 1)
//                        .background(Color.purple)
//                    Image("image2")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width:200,height: 200)
//                        .border(Color.black,width: 1)
//                        .background(Color.purple)
//                    Image("image3")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width:200,height: 200)
//                        .border(Color.black,width: 1)
//                        .background(Color.purple)
//
//                }
            })
        }
    }
}

struct PickerImage_Previews: PreviewProvider {
    static var previews: some View {
        PickerImage()
    }
}

struct ImagePickerView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIViewController{
        let controller = UIImagePickerController()
        return controller
    }
    
    
    func updateUIViewController(_ uiViewController: ImagePickerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        
    }
}

struct DummyView: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<DummyView>) -> UIButton{
        let button = UIButton()
        button.setTitle("DUMMY", for: .normal)
        button.backgroundColor = .red
        return button
    }
    
    func updateUIView(_ uiView: DummyView.UIViewType, context: UIViewRepresentableContext<DummyView>) {
        
    }
    
}
