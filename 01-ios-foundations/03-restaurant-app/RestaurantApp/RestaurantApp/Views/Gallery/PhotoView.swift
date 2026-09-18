//
//  PhotoView.swift
//  RestaurantApp
//
//  Created by Mohsin Ali Ayub on 18.09.26.
//

import SwiftUI

struct PhotoView: View {
    let galleryItem: GalleryItem
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Image(galleryItem.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            dismissButton
        }
    }
    
    private var dismissButton: some View {
        VStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "x.circle")
                    .scaleEffect(2)
                    .foregroundStyle(.black)
            }
            .padding()
            .padding(.top)
            
            Spacer()
        }
    }
}

#Preview {
    PhotoView(galleryItem: GalleryItem(imageName: "gallery7"))
}
