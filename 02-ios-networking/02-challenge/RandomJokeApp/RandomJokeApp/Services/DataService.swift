//
//  DataService.swift
//  RandomJokeApp
//
//  Created by Mohsin Ali Ayub on 23.09.26.
//

import Foundation

struct DataService {
    private let endPoint = "https://v2.jokeapi.dev/joke/Any?blacklistFlags=nsfw,religious,political,racist,sexist,explicit&type=single"
    
    func fetchRandomJoke() async -> Joke? {
        guard let url = URL(string: endPoint) else { return nil }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { return nil }
            
            let joke = try JSONDecoder().decode(Joke.self, from: data)
            return joke            
        } catch {
            print(error)
        }
        
        return nil
    }
}
