//
//  TestAddView.swift
//  WatchYourMind
//
//  Created by Gatang on 3/5/2564 BE.
//

import SwiftUI
import Combine


class UserSettings: ObservableObject {
    @Published var score:Int = 0
}

struct ButtonOne: View {
    @ObservedObject var settings = UserSettings()

    var body: some View {
        HStack {
            Button(action: {
                self.settings.score += 1
                }) {
                    Text("Increase Score")
            }
            Text("In ButtonOne your score is \(settings.score)")
        }
    }
    
}

struct ButtonTwo: View {
    @ObservedObject var settings = UserSettings()

    var body: some View {
        HStack {
            Button(action: {
                self.settings.score -= 1
                }) {
                    Text("Decrease Score")
            }
            Text("In ButtonTwo your score is \(settings.score)")
        }
    }
}

struct TestAddView: View {
    @ObservedObject var settings = UserSettings()

        var body: some View {
            VStack(spacing: 10) {
                Text("In master view your score is \(settings.score)")
                ButtonOne()
                ButtonTwo()
                Text("All scores refer to the same variable, so should be the same.")
            }
        }
    }
struct TestAddView_Previews: PreviewProvider {
    static var previews: some View {
        TestAddView()
    }
}
