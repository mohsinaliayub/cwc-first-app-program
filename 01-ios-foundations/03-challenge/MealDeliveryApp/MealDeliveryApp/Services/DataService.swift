//
//  DataService.swift
//  MealDeliveryApp
//
//  Created by Mohsin Ali Ayub on 18.09.26.
//

import Foundation

struct DataService {
    /// Retrieves an array of meals.
    func fetchMeals() -> [Meal] {
        (1...5).map { Meal(imageName: "\($0)") }
    }
}
