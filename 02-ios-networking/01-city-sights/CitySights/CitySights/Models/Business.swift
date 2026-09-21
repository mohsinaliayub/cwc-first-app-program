//
//  Business.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 21.09.26.
//

import Foundation

struct Business {
    let id: String
    let alias: String?
    let categories: [Category]
    let coordinates: Coordinate?
    let displayPhone: String?
    let distance: Double?
    let imageURL: String?
    let isClosed: Bool?
    let location: Location?
    let name: String
    let phone: String?
    let price: String?
    let rating: Double?
    let reviewCount: Int?
    let url: String?
}

extension Business: Decodable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id, alias, categories, coordinates, distance, location
        case name, phone, price, rating, url
        case displayPhone = "display_phone"
        case imageURL = "image_url"
        case isClosed = "is_closed"
        case reviewCount = "review_count"
    }
}
