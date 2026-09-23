//
//  RandomJokeView.swift
//  RandomJokeApp
//
//  Created by Mohsin Ali Ayub on 23.09.26.
//

import SwiftUI

struct RandomJokeView: View {
    @Environment(JokeViewModel.self) var model
    
    var body: some View {
        ZStack {
            Text(model.text)
            
            VStack {
                Spacer()
                
                Button("Get Random Joke") {
                    model.fetchRandomJoke()
                }
            }
        }
        .padding()
    }
}

#Preview {
    RandomJokeView()
        .environment(JokeViewModel())
}
