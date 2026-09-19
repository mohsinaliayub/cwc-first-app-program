//
//  MapsHelper.swift
//  Guidebook
//
//  Created by Mohsin Ali Ayub on 19.09.26.
//

import SwiftUI

struct MapsHelper {
    /// Check if the Maps application can be opened for provided Attraction object.
    func canOpenMap(for attraction: Attraction) -> Bool {
        // Create URL instance.
        let url = mapURL(for: attraction)
        
        return canOpenMap(for: url)
    }
    
    /// Open the external Maps application for Attraction object.
    func openMap(for attraction: Attraction) {
        // Create URL instance based on maps URL scheme.
        let url = mapURL(for: attraction)
        
        // Check if URL can be opened.
        guard canOpenMap(for: url) else { return }
        
        // Open the URL
        UIApplication.shared.open(url!)  // we checked that this URL can be opened, so force unwrapping.
    }
    
    /// Create a URL to be opened by an iPhone Maps application.
    private func mapURL(for attraction: Attraction) -> URL? {
        let attractionName = cleanName(attraction.name)
        let latLong = cleanCoordinates(attraction.latLong)
        
        let urlScheme = "maps://?q=\(attractionName)&sll=\(latLong)&z=10&t=s"
        return URL(string: urlScheme)
    }
    
    /// Check if the Maps application can be opened for provided URL.
    private func canOpenMap(for url: URL?) -> Bool {
        // If the URL isn't valid, return false.
        guard let url else { return false }
        
        return UIApplication.shared.canOpenURL(url)
    }
    
    /// Replace spaces with '+' symbol and remove any diacritics.
    private func cleanName(_ name: String) -> String {
        name.replacingOccurrences(of: " ", with: "+")
            .folding(options: .diacriticInsensitive, locale: .current)
    }
    
    /// Remove unneeded space characters.
    private func cleanCoordinates(_ coordinateString: String) -> String {
        coordinateString.replacingOccurrences(of: " ", with: "")
    }
}
