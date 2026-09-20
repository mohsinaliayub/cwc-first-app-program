//
//  MovieDetailView.swift
//  MovieList
//
//  Created by Mohsin Ali Ayub on 20.09.26.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top, spacing: 16) {
                Image(movie.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .frame(maxWidth: .infinity)
                
                infoVStack
                    .frame(maxWidth: .infinity)
            }
            
            Text(movie.overview)
                .font(.callout)
            
            Spacer()
        }
        .kerning(1)
        .padding()
    }
    
    var infoVStack: some View {
        VStack(alignment: .leading) {
            Text("Title: ")
            Text(movie.title)
                .font(.title2.bold())
                .padding(.bottom)
            
            Text("Genres:")
            genresView
            
            Text("IMDB Rating:")
            Text("\(String(format: "%.1f", movie.rating))")
                .bold()
        }
    }
    
    var genresView: some View {
        HStack(alignment: .top) {
            ForEach(movie.genres.prefix(2)) { genre in
                Text(genre.name)
                    .font(.caption)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.bar)
                    }
            }
            Spacer()
        }
        .kerning(0)
        .padding(.bottom)
    }
}

#Preview {
    let movie = DataService().fetchMovies()[0]
    MovieDetailView(movie: movie)
}
