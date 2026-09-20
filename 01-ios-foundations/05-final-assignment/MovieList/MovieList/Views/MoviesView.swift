//
//  MoviesView.swift
//  MovieList
//
//  Created by Mohsin Ali Ayub on 20.09.26.
//

import SwiftUI

struct MoviesView: View {
    @State private var movies: [Movie] = []
    private let dataService = DataService()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                moviesView
                    .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Movies")
            .onAppear {
                movies = dataService.fetchMovies()
            }
        }
    }
    
    private var moviesView: some View {
        LazyVStack(alignment: .leading, spacing: 32) {
            ForEach(movies) { movie in
                NavigationLink {
                    MovieDetailView(movie: movie)
                } label: {
                    MovieCard(movie: movie)
                }
            }
        }
    }
}

struct MovieCard: View {
    let movie: Movie
    
    var body: some View {
        ZStack {
            let roundedRectangle = RoundedRectangle(cornerRadius: 15)
            
            Rectangle()
                .background {
                    Image(movie.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .foregroundStyle(.clear)
                .clipShape(roundedRectangle)
            
            roundedRectangle.foregroundStyle(.black.opacity(0.5))
            
            movieTitleAndOverview
        }
        .frame(height: 400)
    }
    
    var movieTitleAndOverview: some View {
        VStack(alignment: .leading) {
            Text(movie.title)
                .font(.title.bold())
            Spacer()
            Text(movie.overview)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
        }
        .foregroundStyle(.white)
        .padding()
    }
}

#Preview {
    MoviesView()
}

#Preview {
    MoviesView()
        .preferredColorScheme(.dark)
}
