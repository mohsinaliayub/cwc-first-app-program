//
//  DataService.swift
//  PokemonApp
//
//  Created by Mohsin Ali Ayub on 19.09.26.
//

import Foundation

struct DataService {
    /// Retrieve an array of Pokemon categories from bundled file.
    func fetchPokemonCategories() -> [PokemonCategory] {
        // Get URL for the data file.
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            return []
        }
        
        do {
            // Read the contents of the file.
            let data = try Data(contentsOf: url)
            
            // Convert data into [PokemonCategory]
            let categories = try JSONDecoder().decode([PokemonCategory].self, from: data)
            return categories
        } catch {
            print("Couldn't read the file or the data wasn't in the correct format.")
        }
        
        return []
    }
}
