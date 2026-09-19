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
    
    /// A dummy category to work with SwiftUI views.
    func previewCategory() -> PokemonCategory {
        let pokemons = [
            Pokemon(name: "Pikachu",
                    summary: "When it is angered, it immediately discharges the energy stored in the pouches in its cheeks.",
                    hp: 3,
                    attack: 4,
                    defense: 3,
                    specialAttack: 3,
                    specialDefense: 3,
                    speed: 6,
                    imageName: "electric-pikachu"),
            Pokemon(name: "Chinchou",
                    summary: "It lives in ocean depths beyond the reach of sunlight. It flashes lights on its antennae to communicate with others of its kind.",
                    hp: 5,
                    attack: 3,
                    defense: 3,
                    specialAttack: 4,
                    specialDefense: 4,
                    speed: 4,
                    imageName: "electric-chinchou"),
            Pokemon(name: "Zapdos",
                    summary: "This legendary Pokémon is said to live in thunderclouds. It freely controls lightning bolts.",
                    hp: 6,
                    attack: 6,
                    defense: 5,
                    specialAttack: 8,
                    specialDefense: 6,
                    speed: 6,
                    imageName: "electric-zapdos"),
            Pokemon(name: "Jolteon",
                    summary: "It concentrates the weak electric charges emitted by its cells and launches wicked lightning bolts.",
                    hp: 4,
                    attack: 4,
                    defense: 4,
                    specialAttack: 6,
                    specialDefense: 5,
                    speed: 7,
                    imageName: "electric-jolteon"),
        ]
        
        return PokemonCategory(name: "Electric", pokemons: pokemons)
    }
}
