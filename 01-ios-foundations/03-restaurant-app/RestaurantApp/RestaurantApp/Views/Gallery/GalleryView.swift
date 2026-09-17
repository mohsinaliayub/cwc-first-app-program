//
//  GalleryView.swift
//  RestaurantApp
//
//  Created by Mohsin Ali Ayub on 17.09.26.
//

import SwiftUI

struct GalleryView: View {
    @State private var galleryItems: [GalleryItem] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                photosGrid
            }
            .navigationTitle("Gallery")
            .scrollIndicators(.hidden)
            .onAppear {
                let dataService = DataService()
                galleryItems = dataService.fetchPhotos()
            }
        }
    }
    
    var photosGrid: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(galleryItems) { photo in
                Image(photo.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
        .padding()
    }
}

#Preview {
    GalleryView()
}
