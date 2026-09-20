//
//  Movie.swift
//  MovieList
//
//  Created by Mohsin Ali Ayub on 20.09.26.
//

import Foundation

/// Represents a digital movie.
struct Movie: Identifiable {
    /// A unique identifier for the movie.
    let id: Int
    /// The official release name of the movie in English.
    let title: String
    /// A short overview of the movie plot.
    let overview: String
    /// The poster name of the movie image included in the Assets catalog.
    let imageName: String
    /// The IMDB rating of the movie on a scale of 1 to 10.
    let rating: Double
    /// The official cinema release date of the movie in string format (yyyy/mm/dd).
    private let releaseDateString: String
    /// A collection of genres, the movie is a part of.
    let genres: [Genre]
}

extension Movie: Decodable {
    enum CodingKeys: String, CodingKey {
        case id, title, overview, genres
        case imageName = "poster_path"
        case rating = "vote_average"
        case releaseDateString = "release_date"
    }
}
