//
//  CategoriesView.swift
//  PokemonApp
//
//  Created by Mohsin Ali Ayub on 19.09.26.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            let dataService = DataService()
            let categories = dataService.fetchPokemonCategories()
            print(categories.count)
        }
    }
}

#Preview {
    CategoriesView()
}
