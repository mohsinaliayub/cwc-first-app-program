//
//  JokeCategory.swift
//  RandomJokeApp
//
//  Created by Mohsin Ali Ayub on 23.09.26.
//

import Foundation

/// Represents a joke category.
enum JokeCategory: String {
    case programming = "Programming"
    case miscellaneous = "Misc"
    case dark = "Dark"
    case pun = "Pun"
    case spooky = "Spooky"
    case christmas = "Christmas"
}

extension JokeCategory: Decodable { }
