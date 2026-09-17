//
//  Movie.swift
//  MovieList
//
//  Created by Mohsin Ali Ayub on 17.09.26.
//

import Foundation

/// Represents a box office movie.
struct Movie: Identifiable {
    /// A unique identifier for the movie.
    let id: UUID = .init()
    /// The release name for the movie.
    let name: String
    /// The name of the poster included in the Assets catalog.
    let posterName: String
}
