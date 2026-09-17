//
//  DataService.swift
//  MovieList
//
//  Created by Mohsin Ali Ayub on 17.09.26.
//

import Foundation

struct DataService {
    /// Fetches an array of movies.
    func fetchMovies() -> [Movie] {
        [
            Movie(name: "Mission Impossible", posterName: "missionimpossible"),
            Movie(name: "Captain America", posterName: "captainamerica"),
            Movie(name: "Home Alone", posterName: "homealone"),
            Movie(name: "Mario Bros", posterName: "mariobros"),
            Movie(name: "Dune", posterName: "dune"),
        ]
    }
}
