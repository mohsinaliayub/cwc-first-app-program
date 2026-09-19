//
//  PokemonCategory.swift
//  PokemonApp
//
//  Created by Mohsin Ali Ayub on 19.09.26.
//

import Foundation

/// A category of Pokemon based on unique capabilities.
struct PokemonCategory: Identifiable, Decodable {
    /// Unique identifier for the category.
    let id: UUID = .init()
    /// The original name of the category.
    let name: String
    /// A collection of Pokemons matching this category.
    let pokemons: [Pokemon]
    
    enum CodingKeys: String, CodingKey {
        case name = "type", pokemons = "pokemon"
    }
}
