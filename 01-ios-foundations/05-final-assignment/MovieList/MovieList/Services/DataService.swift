//
//  DataService.swift
//  MovieList
//
//  Created by Mohsin Ali Ayub on 20.09.26.
//

import Foundation

struct DataService {
    /// Retrieve a collection of movies from bundled json file.
    func fetchMovies() -> [Movie] {
        // Get the url of the json file
        guard let fileURL = Bundle.main.url(forResource: "moviesdata", withExtension: "json") else {
            return []
        }
        
        do {
            // Read the contents of the file as data
            let jsonData = try Data(contentsOf: fileURL)
            
            // Decode data into an array of Movie objects
            return try JSONDecoder().decode([Movie].self, from: jsonData)
        } catch {
            print("Error reading or decoding file: ", error.localizedDescription)
        }
        
        return []
    }
}
