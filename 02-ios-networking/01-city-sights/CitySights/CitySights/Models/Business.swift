//
//  Business.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 21.09.26.
//

import Foundation

/// A local business (e.g. "Pizza Bert Restaurant).
struct Business {
    /// The unique identifier for the business.
    let id: String
    /// The alias for the business, represented in small letters (e.g. "anton-cafébar-passau", not "Anton Cafébar").
    let alias: String?
    /// A collection of categories the business is a part of.
    let categories: [Category]
    /// The latitude and longitude of the business location.
    let coordinates: Coordinate?
    /// Readable representation of business phone number with country code.
    let displayPhone: String?
    /// The distance to the business in meters.
    let distance: Double?
    /// URL for the main display image of the business.
    let imageURL: String?
    /// A flag indicating whether the business is open or closed.
    let isClosed: Bool?
    /// The postal address of the business.
    let location: Location?
    /// The registered name of the business.
    let name: String
    /// The business phone number with country code.
    let phone: String?
    /// General price of the items provided by the business (e.g. "$" cheaper, "$$" normal, "$$$" expensive).
    let price: String?
    /// The business rating based on reviews by visitors.
    let rating: Double?
    /// The total number of reviews for the business.
    let reviewCount: Int?
    /// A link to the registered website of the business, if any.
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
