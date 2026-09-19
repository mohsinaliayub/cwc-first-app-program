//
//  City.swift
//  Guidebook
//
//  Created by Mohsin Ali Ayub on 18.09.26.
//

import Foundation

/// Represents a geographical city.
struct City: Identifiable, Decodable {
    /// A unique identifier for city.
    let id: UUID = .init()
    /// The name of geographical city.
    let name: String
    /// The short description describing the city for tourism.
    let summary: String
    /// The name of the image included in the Assets catalog.
    let imageName: String
    /// An array of attractions available in the city.
    let attractions: [Attraction]
    
    
    enum CodingKeys: CodingKey {
        case name, summary, imageName, attractions
    }
}
