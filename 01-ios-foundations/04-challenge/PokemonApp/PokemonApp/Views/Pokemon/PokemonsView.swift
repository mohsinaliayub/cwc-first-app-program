//
//  PokemonsView.swift
//  PokemonApp
//
//  Created by Mohsin Ali Ayub on 19.09.26.
//

import SwiftUI

struct PokemonsView: View {
    let category: PokemonCategory
    private let columns = Array(repeating: GridItem(), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(category.pokemons) { pokemon in
                    NavigationLink {
                        PokemonDetailView(pokemon: pokemon)
                    } label: {
                        image(for: pokemon)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .navigationTitle(category.name)
    }
    
    private func image(for pokemon: Pokemon) -> some View {
        Image(pokemon.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    NavigationStack {
        PokemonsView(category: DataService().previewCategory())
    }
}
