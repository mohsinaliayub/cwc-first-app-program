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
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image(pokemon.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                
                statsView
                    .frame(maxWidth: .infinity)
            }
            
            Text(pokemon.summary)
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle(pokemon.name)
    }
    
    private var statsView: some View {
        VStack(alignment: .leading) {
            Text("Stats")
                .font(.headline)
                .padding(.bottom)
            
            Text("HP: \(pokemon.hp)")
            Text("Attack: \(pokemon.attack)")
            Text("Defense: \(pokemon.defense)")
            Text("Special Attack: \(pokemon.specialAttack)")
            Text("Special Defense: \(pokemon.specialDefense)")
            Text("Speed: \(pokemon.speed)")
        }
    }
}

#Preview {
    let pokemon = DataService().previewCategory().pokemons[0]
    NavigationStack {
        PokemonDetailView(pokemon: pokemon)
    }
}
