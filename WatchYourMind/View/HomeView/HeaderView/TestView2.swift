//
//  TestView2.swift
//  WatchYourMind
//
//  Created by Gatang on 29/3/2564 BE.
//

import SwiftUI

struct TestView2: View {
    let products = ["iPhone", "iPad", "iMac", "MacBook", "Watch", "AppleTv"]
        @State private var shouldShowSlider = false
        @State private var size: CGFloat = 20.0
        
        var body: some View {
            NavigationView {
                VStack {
                    Section {
                        Toggle(isOn: $shouldShowSlider) {
                            Text("Wanna change font size?")
                        }
                    }.padding()
                    if shouldShowSlider {
                        Slider(value: $size, in: 15...30, label: {
                            Text("Font size")
                        }).padding()
                            .onAppear { print("🟠 Appear") }
                            .onDisappear { print("🟠 Disappear") }
                    }
//                    Section {
//                        List(products, id: \.self) { product in
//                            NavigationLink(destination: DetailView2(productName: product)) {
//                                Text(product)
//                                    .font(.system(size: self.size))
//                            }
//                        }
//                        .navigationBarTitle(Text("Products"))
//                        .onAppear { print("🟢 OnAppear") }
//                        .onDisappear { print("🟢 OnDisappear") }
//                    }
                }
            }
            .onAppear { print("🔴 OnAppear") }
            .onDisappear { print("🔴 OnDisappear") }
        }
    }

struct TestView2_Previews: PreviewProvider {
    static var previews: some View {
        TestView2()
    }
}
