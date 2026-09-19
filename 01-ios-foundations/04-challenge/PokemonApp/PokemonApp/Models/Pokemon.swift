//
//  Pokemon.swift
//  PokemonApp
//
//  Created by Mohsin Ali Ayub on 19.09.26.
//

import Foundation

/// A pokemon character.
struct Pokemon: Identifiable, Decodable {
    /// Unique identifier for the pokemon.
    let id: UUID = .init()
    /// The original name of the pokemon.
    let name: String
    /// A short summary of the pokemon.
    let summary: String
    /// Total health points of the pokemon.
    let hp: Int
    let attack: Int
    let defense: Int
    let specialAttack: Int
    let specialDefense: Int
    let speed: Int
    /// The name of the image included in the Assets catalog.
    let imageName: String
    
    enum CodingKeys: String, CodingKey {
        case name, summary = "about", hp, attack = "atk", defense = "def", specialAttack = "spatk"
        case specialDefense = "spdef", speed = "spd", imageName = "image"
    }
}
