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
    func searchRestaurants() async -> [Business] {
        let latitude = 35.665517
        let longitude = 139.770398
        
        guard let url = URL(string: "https://api.yelp.com/v3/businesses/search?categories=restaurants&latitude=\(latitude)&longitude=\(longitude)&limit=10") else {
            return []
        }
        
        return await fetchBusinesses(from: url)
    }
    
    /// Search local restaurants based on your location.
    func searchRestaurants(for userLocation: CLLocationCoordinate2D?) async -> [Business] {
        guard let userLocation else { return await searchRestaurants() }
        
        let latitude = userLocation.latitude
        let longitude = userLocation.longitude
        
        guard let url = URL(string: "https://api.yelp.com/v3/businesses/search?categories=restaurants&latitude=\(latitude)&longitude=\(longitude)&limit=10") else {
            return []
        }
        
        return await fetchBusinesses(from: url)
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
