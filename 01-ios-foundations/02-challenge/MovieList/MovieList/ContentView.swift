//
//  ContentView.swift
//  MovieList
//
//  Created by Mohsin Ali Ayub on 17.09.26.
//

import SwiftUI

struct ContentView: View {
    @State private var movies: [Movie] = []
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            List(movies) { movie in
                MovieInfoView(movie: movie)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.black)
            }
            .listStyle(.plain)
        }
        .onAppear {
            let dataService = DataService()
            movies = dataService.fetchMovies()
        }
    }
}

#Preview {
    ContentView()
}
