//
//  SearchView2.swift
//  WatchYourMind
//
//  Created by Gatang on 29/3/2564 BE.
//

import SwiftUI

struct SearchView2: View {
    @EnvironmentObject var shop: Shop


//    let array = ["Peter", "Paul", "Mary", "Anna-Lena", "George", "John", "Greg", "Thomas", "Robert", "Bernie", "Mike", "Benno", "Hugo", "Miles", "Michael", "Mikel", "Tim", "Tom", "Lottie", "Lorrie", "Barbara"]
    private var todoItems = [ToDoItem(name: "Tawiporn Tadkaew", idusername: "6009650398"),
                              ToDoItem(name: "Suriya Meekhuntod", idusername:"6009650026" ),
                              ToDoItem(name: "Natnichar Yingyongdamrongsakun", idusername: "6009650505"),
                              ToDoItem(name: "Patcharajak Yongwatthana", idusername: "6009650109"),
                              ToDoItem(name: "Charinrat Soratsa", idusername: "6009650034"),
                              ToDoItem(name: "Tawiporn Tadkaew", idusername: "6009650398")
                                ]
       @State private var searchText = ""
       @State private var showCancelButton: Bool = false
    @State var showSheetView = false

       var body: some View {

//           NavigationView {
        VStack(alignment: .leading, spacing: 5, content: {
            // Search view
            NavigationBarDetailView()
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    
                    TextField("search", text: $searchText, onEditingChanged: { isEditing in
                        self.showCancelButton = true
                    }, onCommit: {
                        print("onCommit")
                    }).foregroundColor(.primary)
                    
                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)
                
                if showCancelButton  {
                    Button("Cancel") {
                        UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                        self.searchText = ""
                        self.showCancelButton = false
                    }
                    .foregroundColor(Color(.systemBlue))
                }
            }
            .padding(.horizontal)
            .navigationBarHidden(showCancelButton) // .animation(.default) // animation does not work properly
            List(todoItems.filter({ searchText.isEmpty ? true : $0.name.contains(searchText)||$0.idusername.contains(searchText) })) { item in
                Text(item.name)
                Text(item.idusername)
                
            }//:List
                            .edgesIgnoringSafeArea(.all)
            //
            //                   .navigationBarTitle(Text("Search"))
//    .ignoresSafeArea(.all, edges: .top)
//            .frame(height: UIScreen.Height, alignment: .center)
            .resignKeyboardOnDragGesture()
            
        })
        
        .background(Color("bg-3"))
        .zIndex(0)
        .ignoresSafeArea(.all, edges: .all)
        
//        .frame(height: 300)

               
//           }
       }
   }



   struct ContentView_Previews: PreviewProvider {
//    static let animals: [Animal] = Bundle.main.decode("animals.json")

       static var previews: some View {
//           Group {
        SearchView2()
//                 .environment(\.colorScheme, .light)
            .environmentObject(Shop())

//            SearchView2()
//                 .environment(\.colorScheme, .dark)
//           }
       }
   }

   extension UIApplication {
       func endEditing(_ force: Bool) {
           self.windows
               .filter{$0.isKeyWindow}
               .first?
               .endEditing(force)
       }
   }

   struct ResignKeyboardOnDragGesture2: ViewModifier {
       var gesture = DragGesture().onChanged{_ in
           UIApplication.shared.endEditing(true)
       }
       func body(content: Content) -> some View {
           content.gesture(gesture)
       }
   }

   extension View {
       func resignKeyboardOnDragGesture2() -> some View {
           return modifier(ResignKeyboardOnDragGesture())
       }
   }
