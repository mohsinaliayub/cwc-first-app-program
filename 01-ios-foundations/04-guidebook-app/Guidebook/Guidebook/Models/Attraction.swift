//
//  Attraction.swift
//  Guidebook
//
//  Created by Mohsin Ali Ayub on 18.09.26.
//

import Foundation

/// A geographical attraction for tourists.
struct Attraction: Identifiable {
    /// Unique identifier for the attraction.
    let id: UUID = .init()
    /// The original name of the attraction.
    let name: String
    /// A short description for the attraction.
    let summary: String
    /// A detailed description of the attraction describing its history and uniqueness.
    let longDescription: String
    /// The name of the image included in the Assets catalog.
    let imageName: String
    /// The geographical latitude and longitude of the attraction.
    let latLong: String
}
