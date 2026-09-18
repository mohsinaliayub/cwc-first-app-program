//
//  Meal.swift
//  MealDeliveryApp
//
//  Created by Mohsin Ali Ayub on 18.09.26.
//

import Foundation

struct Meal: Identifiable {
    /// Uniquely identifies a meal.
    let id: UUID = .init()
    /// Image name for the meal included in the Asset catalog.
    let imageName: String
}
