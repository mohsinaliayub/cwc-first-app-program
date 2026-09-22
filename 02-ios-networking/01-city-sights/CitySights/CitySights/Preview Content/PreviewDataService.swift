//
//  PreviewDataService.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 22.09.26.
//

import Foundation

struct PreviewDataService {
    func searchRestaurants() -> [Business] {
        guard let url = Bundle.main.url(forResource: "preview_business_data", withExtension: "json") else {
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let businessSearch = try JSONDecoder().decode(BusinessSearch.self, from: data)
            return businessSearch.businesses
        } catch {
            print(error)
        }
        
        return []
    }
    
    func previewBusiness() -> Business {
        return searchRestaurants()[0]
    }
}
