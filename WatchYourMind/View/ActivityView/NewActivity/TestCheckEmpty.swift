//
//  TestCheckEmpty.swift
//  WatchYourMind
//
//  Created by Gatang on 20/4/2564 BE.
//

import SwiftUI

struct TestCheckEmpty: View {

    @State private var username = ""
       @State private var email = ""

       var body: some View {
           Form {
               Section {
                   TextField("Username", text: $username)
                   TextField("Email", text: $email)
               }

//               Section {
                   Button("Create account") {
                       print("Creating account…")
                   }
//               }
               .disabled(username.isEmpty || email.isEmpty)

           }
       }
}

struct TestCheckEmpty_Previews: PreviewProvider {
    static var previews: some View {
        TestCheckEmpty()
    }
}



