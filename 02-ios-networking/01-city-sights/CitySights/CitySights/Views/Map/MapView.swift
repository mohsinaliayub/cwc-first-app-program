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
    
    var body: some View {
        Map() {
            ForEach(model.businesses) { business in
                Marker(business.name, coordinate: CLLocationCoordinate2D(latitude: business.coordinates?.latitude ?? 0,
                                                                         longitude: business.coordinates?.longitude ?? 0))
            }
        }
    }
}

#Preview {
    MapView()
        .environment(BusinessViewModel(dataService: DataService()))
}
