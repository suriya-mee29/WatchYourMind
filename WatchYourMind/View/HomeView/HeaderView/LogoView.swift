//
//  Created by Robert Petras
//  SwiftUI Masterclass ♥ Better Apps. Less Code.
//  https://swiftuimasterclass.com
//

import SwiftUI

struct LogoView: View {
  var body: some View {
    HStack(spacing: 4) {
      Text("watch".uppercased())
        .font(.title3)
        .fontWeight(.black)
        .foregroundColor(.black)
      
        Image("watchmymind-light-logo")
        .resizable()
        .scaledToFit()
        .frame(width: 30, height: 30, alignment: .center)
      
      Text("your mind".uppercased())
        .font(.title3)
        .fontWeight(.black)
        .foregroundColor(.black)
    } //: HSTACK
  }
}

struct LogoView_Previews: PreviewProvider {
  static var previews: some View {
    LogoView()
        .preferredColorScheme(.light)
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
