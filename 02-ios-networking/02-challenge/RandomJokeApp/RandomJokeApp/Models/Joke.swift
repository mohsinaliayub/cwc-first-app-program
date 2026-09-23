//
//  Joke.swift
//  RandomJokeApp
//
//  Created by Mohsin Ali Ayub on 23.09.26.
//

import Foundation

/// A one-line joke.
struct Joke {
    /// Unique identifier for the joke.
    let id: Int
    /// A one-line joke text.
    let text: String
    /// The category for the joke.
    let category: JokeCategory
    /// A flag indicating if the joke is safe or contains blacklist flags.
    let safe: Bool
    /// The language of the joke represented with two-digit code.
    let language: String
}

extension Joke: Decodable {
    enum CodingKeys: String, CodingKey {
        case id, category, safe
        case text = "joke"
        case language = "lang"
    }
}
