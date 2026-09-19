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

struct CategoryRow: View {
    let category: PokemonCategory
    
    init(for pokemonCategory: PokemonCategory) {
        self.category = pokemonCategory
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(color)
            .frame(height: 60)
            .overlay {
                HStack {
                    Image(systemName: iconName)
                    Text(category.name).font(.headline)
                }
            }
    }
    
    private var iconName: String {
        switch (category.name) {
        case "Electric":
            return "bolt.circle"
        case "Fire":
            return "flame.circle"
        case "Grass":
            return "leaf.circle"
        case "Water":
            return "drop.circle"
        default:
            return ""
        }
    }
    
    private var color: Color {
        switch (category.name) {
        case "Electric":
            return Color.yellow
        case "Fire":
            return Color.red
        case "Grass":
            return Color.green
        case "Water":
            return Color.blue
        default:
            return Color.gray
        }
    }
}

#Preview {
    CategoriesView()
}
