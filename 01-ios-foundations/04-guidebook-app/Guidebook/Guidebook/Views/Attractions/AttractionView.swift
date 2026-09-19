//
//  AttractionView.swift
//  Guidebook
//
//  Created by Mohsin Ali Ayub on 18.09.26.
//

import SwiftUI

struct AttractionView: View {
    let attraction: Attraction
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 10) {
                Image(attraction.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(attraction.name)
                            .font(.title)
                            .bold()
                        Text(attraction.longDescription)
                            .multilineTextAlignment(.leading)
                        
                        if canOpenMap(for: mapURL(for: attraction)) {
                            getDirectionsButton
                                .padding(.top)
                        }
                    }
                    .frame(maxWidth: proxy.size.width)
                    .padding(.bottom, 30)
                    .padding(.horizontal)
                }
                .scrollIndicators(.hidden)
            }
            .ignoresSafeArea()
        }
    }
    
    private var getDirectionsButton: some View {
        Button {
            openMap(for: attraction)
        } label: {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.blue)
                .frame(height: 48)
                .overlay {
                    Text("Get Directions")
                        .foregroundStyle(.white)
                }
        }
    }
    
    func openMap(for attraction: Attraction) {
        // Create URL instance based on maps URL scheme.
        let url = mapURL(for: attraction)
        
        // Check if URL can be opened.
        guard canOpenMap(for: url) else { return }
        
        // Open the URL
        UIApplication.shared.open(url!)  // we checked that this URL can be opened, so force unwrapping.
    }
    
    /// Create a URL to be opened by an iPhone Maps application.
    func mapURL(for attraction: Attraction) -> URL? {
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

#Preview {
    let attraction = DataService.fetchPreviewCity().attractions[1]
    AttractionView(attraction: attraction)
}
