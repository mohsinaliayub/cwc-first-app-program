//
//  RandomJokeApp.swift
//  RandomJokeApp
//
//  Created by Mohsin Ali Ayub on 23.09.26.
//

import SwiftUI

@main
struct RandomJokeApp: App {
    @State private var jokeViewModel = JokeViewModel()
    
    var body: some Scene {
        WindowGroup {
            RandomJokeView()
                .environment(jokeViewModel)
        }
    }
}
