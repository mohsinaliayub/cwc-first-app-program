//
//  CategoriesView.swift
//  PokemonApp
//
//  Created by Mohsin Ali Ayub on 19.09.26.
//

import SwiftUI

struct CategoriesView: View {
    @State private var pokemonCategories: [PokemonCategory] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                categoriesView
                    .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Categories")
            .onAppear {
                let dataService = DataService()
                pokemonCategories = dataService.fetchPokemonCategories()
            }
        }
    }
    
    private var categoriesView: some View {
        VStack(spacing: 12) {
            ForEach(pokemonCategories) { category in
                NavigationLink {
                    PokemonsView(category: category)
                } label: {
                    CategoryRow(for: category)
                        .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    CategoriesView()
}
