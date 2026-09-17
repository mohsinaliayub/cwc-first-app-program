//
//  GalleryView.swift
//  RestaurantApp
//
//  Created by Mohsin Ali Ayub on 17.09.26.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(1..<12) { id in
                        Image("gallery\(id)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding()
            }
            .navigationTitle("Gallery")
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    GalleryView()
}
