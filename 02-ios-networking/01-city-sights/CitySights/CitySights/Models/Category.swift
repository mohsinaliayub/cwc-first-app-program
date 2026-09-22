//
//  Category.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 21.09.26.
//

import Foundation

/// Category to filter the search results with.
struct Category: Decodable {
    /// The alias for the category.
    ///
    /// Its is always represented in small letters with no spaces (e.g. "discgolf", not "Disc Golf").
    let alias: String
    /// The renowned name for the category.
    let title: String
}
