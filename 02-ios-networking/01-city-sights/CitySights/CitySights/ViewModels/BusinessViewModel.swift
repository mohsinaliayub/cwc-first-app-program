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
    var categories: [Category] = []
    var searchOptions: [SearchOption] = []
    var selectedBusiness: Business?
    var locationAuthStatus: CLAuthorizationStatus = .notDetermined
    
    private let dataService: DataService
    private let locationManager = CLLocationManager()
    private var currentUserLocation: CLLocationCoordinate2D?
    
    init(dataService: DataService = DataService()) {
        self.dataService = dataService
        super.init()
        fetchCategories()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
    }
    
    func searchBusinesses(query: String?, options: String?, category: String?) {
        Task {
            businesses = await dataService.searchRestaurants(for: currentUserLocation, query: query, options: options, category: category)
        }
    }
    
    /// Locates the user.
    func getUserLocation() {
        // Check if we have user location.
        guard locationManager.authorizationStatus == .authorizedWhenInUse else {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        currentUserLocation = nil
        locationManager.requestLocation()
    }
    
    private func fetchCategories() {
        // Right now, we are working with only two categories.
        // So, no need to call the API.
        categories.append(Category(alias: "restaurants", title: "Restaurants"))
        categories.append(Category(alias: "arts", title: "Arts"))
    }
    
    private func createOptionsForSearch() {
        searchOptions.append(SearchOption(id: "hot_and_new", title: "Popular"))
        searchOptions.append(SearchOption(id: "deals", title: "Deals On"))
    }
}

extension BusinessViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.locationAuthStatus = manager.authorizationStatus
        
        // Detect if user allowed, then request location.
        guard locationManager.authorizationStatus == .authorizedWhenInUse else {
            return
        }
        
        currentUserLocation = nil
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // If location is not nil, search businesses.
        if currentUserLocation == nil {
            currentUserLocation = locations.last?.coordinate
            searchBusinesses(query: nil, options: nil, category: nil)
        }
        
        // Stop location updates to preserve batter.
        manager.stopUpdatingLocation()
    }
}
