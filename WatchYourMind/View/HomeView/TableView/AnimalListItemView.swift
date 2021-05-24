//
//  AnimalListItemView.swift
//  WatchYourMind
//
//  Created by Gatang on 5/4/2564 BE.
//

import SwiftUI

struct AnimalListItemView: View {
  // MARK: - PROPERTIES
  
  let animal: User
    let create: Date


  // MARK: - BODY

  var body: some View {
    HStack(alignment:.center) {
        VStack(alignment: .leading, spacing: 3) {
            Text(animal.name.uppercased())
                .font(.system(size: 15))
               
                .font(.headline)
                .fontWeight(.bold)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(2)
                .foregroundColor(.black)
        HStack{
                
            VStack{
                Text("ID")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .font(.system(size: 10))
                
                    Text(animal.headline)
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .font(.system(size: 8))
                }
                Text("\(Image.init(systemName: "circle.fill"))")
                    .font(.system(size: 5))
                    .foregroundColor(.gray)
            VStack{
                Text("Gender")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .font(.system(size: 10))
                Text(animal.gender)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .font(.system(size: 8))
            }
                Text("\(Image.init(systemName: "circle.fill"))")
                    .font(.system(size: 5))
                    .foregroundColor(.gray)
            VStack{
                Text("Assigned")                    .font(.footnote)
                    .foregroundColor(.gray)
                    .font(.system(size: 10))
                Text("\(create , formatter: taskDateFormat)")                    .font(.footnote)
                    .foregroundColor(.gray)
                    .font(.system(size: 8))

            }

            }

         
        
        } //: VSTACK
//        Spacer()
        .padding(.trailing,8)
        ProgressBarView(value: CGFloat(60), color: Color.red,fontsize:10,circlelinewidth:5)
            .frame(width: 40, height: 40)
//            .padding(.horizontal)
     
    } //: HSTACK
    .padding()
  }
}



// MARK: - PREVIEW

struct AnimalListItemView_Previews: PreviewProvider {
  static let animals: [User] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    AnimalListItemView(animal: animals[0], create: Date())
     
//      .padding()
  }
}
