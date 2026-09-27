//
//  DataService.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 21.09.26.
//

import Foundation
import CoreLocation

struct DataService {
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    /// Search local restaurants based on your location.
    func searchRestaurants(for userLocation: CLLocationCoordinate2D?, query: String?, options: String?, category: String?) async -> [Business] {
        guard let url = createBusinessSearchURL(for: userLocation, query: query, options: options, category: category) else {
            return []
        }
        
        return await fetchBusinesses(from: url)
    }
    
    private func createBusinessSearchURL(for location: CLLocationCoordinate2D?, query: String?, options: String?, category: String?) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.yelp.com"
        components.path = "/v3/businesses/search"
        
        let latitude = location?.latitude ?? 35.665517
        let longitude = location?.longitude ?? 139.770398
        
        var queryItems: [URLQueryItem] = [
            URLQueryItem(name: "latitude", value: String(latitude)),
            URLQueryItem(name: "longitude", value: String(longitude)),
            URLQueryItem(name: "limit", value: "20")
        ]
        if let query, !query.isEmpty {
            queryItems.append(URLQueryItem(name: "term", value: query))
        }
        if let options, !options.isEmpty {
            queryItems.append(URLQueryItem(name: "attributes", value: options))
        }
        if let category {
            queryItems.append(URLQueryItem(name: "categories", value: category))
        }
        
        components.queryItems = queryItems
        return components.url
    }
    
    
    /// Fetch local businesses from api.
    private func fetchBusinesses(from url: URL) async -> [Business] {
        guard let apiKey else { return [] }
        
        // Create URL Request
        var request = URLRequest(url: url)
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        
        // Send request
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            // Check if response is successful
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { return [] }
            
            // Parse the JSON data
            let businessSearch = try JSONDecoder().decode(BusinessSearch.self, from: data)
            return businessSearch.businesses
        } catch {
            print(error)
        }
        
        return []
    }
}
