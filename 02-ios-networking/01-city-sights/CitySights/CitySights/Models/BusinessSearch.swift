//
//  BusinessSearch.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 21.09.26.
//

import Foundation

/// Represents a local business search request on Yelp.
struct BusinessSearch {
    /// A collection of businesses matching your request.
    let businesses: [Business]
    /// The origin of the search request.
    let region: Region
    /// The total number of local businesses found with your request.
    let total: Int
}

extension BusinessSearch: Decodable {
    
}
