//
//  NicknameView.swift
//  WatchYourMind
//
//  Created by Gatang on 26/2/2564 BE.
//

import SwiftUI

struct NicknameView: View {
    let nickname: String
    var body: some View {
        ZStack {
            Text(nickname.uppercased())
                .font(.title)
                .foregroundColor(.white)
            
                .padding()
        }
        .background(Circle().foregroundColor(.blue))
    }
}

struct NicknameView_Previews: PreviewProvider {
    static var previews: some View {
        NicknameView(nickname: "TT")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
