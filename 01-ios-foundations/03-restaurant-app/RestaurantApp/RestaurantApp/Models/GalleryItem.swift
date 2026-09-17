//
//  GalleryItem.swift
//  RestaurantApp
//
//  Created by Mohsin Ali Ayub on 17.09.26.
//

import Foundation

/// Represents an image asset.
struct GalleryItem: Identifiable {
    /// A unique identifier for each gallery item.
    let id: UUID = .init()
    /// The image name in the Assets catalog.
    let imageName: String
}
