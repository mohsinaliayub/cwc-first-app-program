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
            
            List(movies, id: \.id) { movie in
                VStack {
                    Image(movie.posterName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text(movie.name)
                        .foregroundStyle(.white)
                        .font(.headline)
                }
                .listRowBackground(Color.black)
            }
            .listStyle(.plain)
            .padding(8)
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
