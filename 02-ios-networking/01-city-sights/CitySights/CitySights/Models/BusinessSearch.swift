//
//  BusinessSearch.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 21.09.26.
//

import Foundation

struct BusinessSearch {
    let businesses: [Business]
    let region: Region
    let total: Int
}

extension BusinessSearch: Decodable {
    
}
