//
//  Location.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 21.09.26.
//

import Foundation

struct Location {
    let address1: String?
    let address2: String?
    let address3: String?
    let city: String?
    let country: String?
    let displayAddress: [String]?
    let state: String?
    let zipCode: String?
}

extension Location: Decodable {
    enum CodingKeys: String, CodingKey {
        case address1, address2, address3, city, country, state
        case displayAddress = "display_address"
        case zipCode = "zip_code"
    }
}
