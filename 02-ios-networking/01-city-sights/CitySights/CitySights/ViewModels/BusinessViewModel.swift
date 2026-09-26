//
//  BusinessViewModel.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 23.09.26.
//

import SwiftUI
import CoreLocation

@Observable
class BusinessViewModel {
    var query = ""
    var businesses: [Business] = []
    var selectedBusiness: Business?
    
    private let dataService: DataService
    private let locationManager = CLLocationManager()
    
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    func searchBusinesses() async {
        businesses = await dataService.searchRestaurants()
    }
    
    /// Locates the user.
    func getUserLocation() {
        // Check if we have user location.
        guard locationManager.authorizationStatus == .authorizedWhenInUse else {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        locationManager.requestLocation()
    }
}
