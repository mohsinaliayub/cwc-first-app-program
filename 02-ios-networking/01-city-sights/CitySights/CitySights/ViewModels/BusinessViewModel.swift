//
//  BusinessViewModel.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 23.09.26.
//

import SwiftUI

@Observable
class BusinessViewModel {
    var query = ""
    var businesses: [Business] = []
    var selectedBusiness: Business?
    
    private let dataService: DataService
    
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    func searchBusinesses() async {
        businesses = await dataService.searchRestaurants()
    }
}
