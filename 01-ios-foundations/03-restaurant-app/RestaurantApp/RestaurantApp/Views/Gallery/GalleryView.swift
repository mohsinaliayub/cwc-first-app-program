//
//  GalleryView.swift
//  RestaurantApp
//
//  Created by Mohsin Ali Ayub on 17.09.26.
//

import SwiftUI

struct GalleryView: View {
    @State private var galleryItems: [GalleryItem] = []
    private let columns = Array(repeating: GridItem(spacing: 10), count: 3)
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    photosGrid(for: proxy.size)
                }
                .navigationTitle("Gallery")
                .scrollIndicators(.hidden)
                .onAppear {
                    let dataService = DataService()
                    galleryItems = dataService.fetchPhotos()
                }
            }
        }
    }
    
    func photosGrid(for size: CGSize) -> some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(galleryItems) { photo in
                resizableImage(photo.imageName, for: size)
            }
        }
        .padding(.horizontal)
    }
    
    func resizableImage(_ name: String, for size: CGSize) -> some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fill)
            // remove 2*16=>32 (horizontal padding) and 2*10=>20 (spacing) from width
            .frame(maxWidth: (size.width - 52) / 3)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    GalleryView()
}
