//
//  CityDetailView.swift
//  Guidebook
//
//  Created by Mohsin Ali Ayub on 18.09.26.
//

import SwiftUI

struct CityDetailView: View {
    let city: City
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(city.attractions) { attraction in
                    NavigationLink {
                        AttractionView(attraction: attraction)
                    } label: {
                        Text(attraction.name)
                            .font(.headline)
                    }
                }
            }
        }
    }
}

#Preview {
    CityDetailView(city: DataService.fetchPreviewCity())
}
