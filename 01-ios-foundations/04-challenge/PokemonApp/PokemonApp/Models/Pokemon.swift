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
    let about: String
    let hp: Int
    let atk: Int
    let def: Int
    let spatk: Int
    let spdef: Int
    let spd: Int
    /// The name of the image included in the Assets catalog.
    let imageName: String
    
    enum CodingKeys: String, CodingKey {
        case name, about, hp, atk, def, spatk, spdef, spd
        case imageName = "image"
    }
}
