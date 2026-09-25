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
            
        }
    }
}

#Preview {
    MapView()
        .environment(BusinessViewModel(dataService: DataService()))
}
