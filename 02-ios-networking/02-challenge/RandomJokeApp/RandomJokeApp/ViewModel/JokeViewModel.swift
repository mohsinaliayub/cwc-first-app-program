//
//  JokeViewModel.swift
//  RandomJokeApp
//
//  Created by Mohsin Ali Ayub on 23.09.26.
//

import Foundation

@Observable
class JokeViewModel {
    private var joke: Joke?
    private var error: String?
    var text: String {
        joke?.text ?? error ?? "Click Button to Get a Random Joke"
    }
    private let dataService = DataService()
    
    func fetchRandomJoke() {
        Task {
            if let joke = await dataService.fetchRandomJoke() {
                self.joke = joke
            } else {
                error = "Couldn't find the joke. Please try again..."
            }
        }
    }
}
