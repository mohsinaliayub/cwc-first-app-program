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
            VStack(alignment: .leading, spacing: 40) {
                ForEach(city.attractions) { attraction in
                    NavigationLink {
                        AttractionView(attraction: attraction)
                    } label: {
                        AttractionRow(attraction: attraction)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
        }
        .scrollIndicators(.hidden)
        .preferredColorScheme(.dark)
        .navigationTitle(city.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CityDetailView(city: DataService.fetchPreviewCity())
}
