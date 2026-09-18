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
                VStack {
                    ForEach(cities) { city in
                        NavigationLink {
                            CityDetailView(city: city)
                        } label: {
                            Text(city.name)
                                .font(.headline)
                        }
                    }
                }
                .padding()
            }
        }
        .onAppear {
            let dataService = DataService()
            cities = dataService.fetchCities()
        }
    }
}

#Preview {
    CitiesView()
}
