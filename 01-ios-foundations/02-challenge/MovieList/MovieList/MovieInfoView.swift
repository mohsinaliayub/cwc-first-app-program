//
//  MovieInfoView.swift
//  MovieList
//
//  Created by Mohsin Ali Ayub on 17.09.26.
//

import SwiftUI

struct MovieInfoView: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            Image(movie.posterName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(movie.name)
                .foregroundStyle(.white)
                .font(.headline)
        }
    }
}

#Preview {
    MovieInfoView(movie: Movie(name: "Mission Impossible", posterName: "missionimpossible"))
        .preferredColorScheme(.dark)
}
