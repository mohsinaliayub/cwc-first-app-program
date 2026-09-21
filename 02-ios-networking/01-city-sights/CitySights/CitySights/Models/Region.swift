//
//  Region.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 21.09.26.
//

import Foundation

struct Region: Decodable {
    let center: Coordinate?
}

struct Coordinate: Decodable {
    let latitude: Double?
    let longitude: Double?
}
