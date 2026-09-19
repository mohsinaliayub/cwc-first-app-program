//
//  PokemonDetailView.swift
//  PokemonApp
//
//  Created by Mohsin Ali Ayub on 19.09.26.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    
    var body: some View {
        Text(pokemon.summary)
            .navigationTitle(pokemon.name)
    }
}

#Preview {
    let pokemon = DataService().previewCategory().pokemons[0]
    NavigationStack {
        PokemonDetailView(pokemon: pokemon)
    }
}
