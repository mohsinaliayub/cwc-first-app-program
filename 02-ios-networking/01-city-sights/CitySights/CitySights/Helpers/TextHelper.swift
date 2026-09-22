//
//  TextHelper.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 22.09.26.
//

import Foundation

struct TextHelper {
    /// Convert distance from meters to a string representation for UI.
    static func distanceAwayText(meters: Double) -> String {
        let metersInt = Int(round(meters))
        let result: String
        if metersInt > 1000 {
            result = "\(metersInt/1000) km away"
        } else {
            result = "\(metersInt) m away"
        }
        
        return result
    }
}
