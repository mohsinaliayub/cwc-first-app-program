//
//  BusinessViewModel.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 23.09.26.
//

import SwiftUI
import CoreLocation

@Observable
class BusinessViewModel: NSObject {
    var query = ""
    var businesses: [Business] = []
    var selectedBusiness: Business?
    
    private let dataService: DataService
    private let locationManager = CLLocationManager()
    
    init(dataService: DataService = DataService()) {
        self.dataService = dataService
        super.init()
        locationManager.delegate = self
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

extension BusinessViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // Detect if user allowed, then request location.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
}
