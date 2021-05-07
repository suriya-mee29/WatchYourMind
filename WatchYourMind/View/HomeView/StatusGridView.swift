//
//  StatusGridView.swift
//  WatchYourMind
//
//  Created by Gatang on 24/2/2564 BE.
//

import SwiftUI

struct StatusGridView: View {
//    @State private var gridLayout = [GridItem(.flexible())]
    @State private var gridcolum : Int = 2
    let columnSpacing: CGFloat = 10
    var body: some View {

        
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHGrid(rows: [GridItem(.fixed(150))], alignment: .center, spacing: 0, pinnedViews: [], content: {

            
                StatusView(statusTitle: "Seed".uppercased(), iconName: "seed", statusLabel: "Client have seed", count_status: "21",bg_image: "seedColor")
                    .padding(.horizontal,4)

                StatusView(statusTitle: "Seeding".uppercased(), iconName: "seeding", statusLabel: "Client have seeding", count_status: "13",bg_image: "seedingColor")
                    .padding(.horizontal,4)


                StatusView(statusTitle: "Sapling".uppercased(), iconName: "sapling", statusLabel: "Client have sapling", count_status: "8",bg_image: "saplingColor")
                    .padding(.horizontal,4)


                StatusView(statusTitle: "Tree".uppercased(), iconName: "Tree", statusLabel: "Client have\n tree", count_status: "8",bg_image: "treeColor")
                    .padding(.horizontal,4)

                StatusView(statusTitle: "Blooming".uppercased(), iconName: "Blooming", statusLabel: "Client have blooming", count_status: "8",bg_image: "bloomingColor")
                    .padding(.horizontal,4)

           
          }) //: GRID
//          .frame(height: 140)
            .fixedSize()
//          .padding(.horizontal)
//          .padding(.vertical, 10)
          .shadow(radius:10 )
        }) //: SCROLL

    }
}
//

struct StatusGridView_Previews: PreviewProvider {
    static var previews: some View {
        StatusGridView().previewLayout(.sizeThatFits)
    }
}
