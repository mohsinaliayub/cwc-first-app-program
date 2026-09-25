//
//  MapView.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 23.09.26.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Environment(BusinessViewModel.self) var model
    @State private var selectedBusinessID: String?
    
    var body: some View {
        Map(selection: $selectedBusinessID) {
            ForEach(model.businesses) { business in
                Marker(business.name, coordinate: CLLocationCoordinate2D(latitude: business.coordinates?.latitude ?? 0,
                                                                         longitude: business.coordinates?.longitude ?? 0))
                .tag(business.id)
            }
        }
        .onChange(of: selectedBusinessID) { oldValue, newValue in
            // Find the matching business
        }
    }
}

#Preview {
    MapView()
        .environment(BusinessViewModel(dataService: DataService()))
}
