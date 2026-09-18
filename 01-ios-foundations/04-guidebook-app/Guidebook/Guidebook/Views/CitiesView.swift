//
//  CitiesView.swift
//  Guidebook
//
//  Created by Mohsin Ali Ayub on 18.09.26.
//

import SwiftUI

struct CitiesView: View {
    @State private var cities: [City] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(cities) { city in
                        NavigationLink {
                            CityDetailView(city: city)
                        } label: {
                            CityCardView(city: city)
                        }
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
        .ignoresSafeArea()
        .preferredColorScheme(.dark)
        .onAppear {
            let dataService = DataService()
            cities = dataService.fetchCities()
        }
    }
}

#Preview {
    CitiesView()
}
