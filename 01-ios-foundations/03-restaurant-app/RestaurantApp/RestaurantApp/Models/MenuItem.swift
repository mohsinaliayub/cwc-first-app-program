//
//  MenuItem.swift
//  RestaurantApp
//
//  Created by Mohsin Ali Ayub on 17.09.26.
//

import Foundation

/// A suhsi menu item.
struct MenuItem: Identifiable {
    /// A unique identifier for each sushi item.
    let id: UUID = .init()
    /// The name to represent the sushi dish.
    let name: String
    /// The price of sushi dish in dollars rounded to two decimal digits.
    let price: String
    /// The image name of the sushi dish in the Assets catalog.
    let imageName: String
}
