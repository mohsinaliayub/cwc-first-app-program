//
//  ContentView.swift
//  RandomJokeApp
//
//  Created by Mohsin Ali Ayub on 23.09.26.
//

import SwiftUI

struct ContentView: View {
    @State private var joke: Joke?
    @State private var error: String?
    private let service = DataService()
    
    var body: some View {
        ZStack {
            Text(joke?.text ?? error ?? "Click Button to Get a Random Joke")
            
            VStack {
                Spacer()
                
                Button("Get Random Joke") {
                    fetchJoke()
                }
            }
        }
        .padding()
    }
    
    private func fetchJoke() {
        Task {
            if let joke = await service.fetchRandomJoke() {
                self.joke = joke
            } else {
                error = "Couldn't find the joke. Please try again..."
            }
        }
    }
}

#Preview {
    ContentView()
}
