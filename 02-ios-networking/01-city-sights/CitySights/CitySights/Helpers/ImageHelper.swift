//
//  ImageHelper.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 22.09.26.
//

import Foundation

struct ImageHelper {
    static func ratingImageName(for rating: Double) -> String {
        guard rating > 1 else { return "regular_0.0" }
        
        let quotient = floor(rating)
        var remainder = rating.remainder(dividingBy: quotient)
        
        
        if remainder < 0.25 {
            remainder = 0.0
        } else if remainder < 0.75 {
            remainder = 0.5
        } else if remainder >= 0.75 {
            remainder = 1.0
        }
        
        let newRating = quotient + remainder
        return "regular_\(newRating)"
    }
}
