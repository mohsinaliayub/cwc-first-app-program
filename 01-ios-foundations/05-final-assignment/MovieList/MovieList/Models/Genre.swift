//
//  Genre.swift
//  MovieList
//
//  Created by Mohsin Ali Ayub on 20.09.26.
//

import Foundation

/// Official genre for movies.
struct Genre: Identifiable {
    /// A unique identifier for the genre.
    let id: Int
    /// The official name of the genre.
    let name: String
}

extension Genre: Decodable { }
