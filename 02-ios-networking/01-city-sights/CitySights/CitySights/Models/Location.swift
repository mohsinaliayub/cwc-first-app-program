//
//  Location.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 21.09.26.
//

import Foundation

/// An immutable representation of the postal address for a business.
struct Location {
    /// The street name in a postal address.
    let address1: String?
    /// Additional information associated with the location, typically defined at the street level, in a postal address.
    let address2: String?
    /// Additional information associated with the location, typically defined at the city or town level, in a postal address.
    let address3: String?
    /// The city name in a postal address.
    let city: String?
    /// The country or region name in a postal address, commonly represented by alpha-2 or alpha-3 code (e.g. "DE" for Germany).
    let country: String?
    /// The full postal address of the business, separated by parts in an array of strings.
    let displayAddress: [String]?
    /// The state name in a postal address, commonly represented by a code (e.g. "BY" for Bavaria).
    let state: String?
    /// The postal code in a postal address.
    let zipCode: String?
}

extension Location: Decodable {
    enum CodingKeys: String, CodingKey {
        case address1, address2, address3, city, country, state
        case displayAddress = "display_address"
        case zipCode = "zip_code"
    }
}
