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
        ScrollView {
            VStack {
                ForEach(cities) { city in
                    Text(city.name)
                }
            }
            .padding()
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
