//
//  Region.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 21.09.26.
//

import Foundation

/// The origin of the location described with a set of latitude and longitude.
struct Region: Decodable {
    /// The origin of the location.
    let center: Coordinate
}

/// The latitude and longitude associated with a location.
struct Coordinate: Decodable {
    /// The latitude in degrees.
    let latitude: Double
    /// The longitude in degrees.
    let longitude: Double
}
