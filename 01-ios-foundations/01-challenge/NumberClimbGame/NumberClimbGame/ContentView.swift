//
//  ContentView.swift
//  NumberClimbGame
//
//  Created by Mohsin Ali Ayub on 16.09.26.
//

import SwiftUI

struct ContentView: View {
    @State private var number = 0
    @State private var shouldIncrease = true
    
    var body: some View {
        VStack(spacing: 12) {
            Text("\(number)")
                .font(.largeTitle)
            Button("Tap Me!") {
                increaseOrDecrease()
            }
        }
        .padding()
    }
    
    func increaseOrDecrease() {
        // if number goes above 50, start decreasing.
        // If number goes below 0, start increasing.
        let upperLimit = 50
        let lowerLimit = 0
        
        if shouldIncrease {
            increase()
            if number > upperLimit {
                shouldIncrease = false
            }
        } else {
            decrease()
            if number < lowerLimit {
                shouldIncrease = true
            }
        }
    }
    
    func increase() {
        number += randomNumberBetween1And10()
    }
    
    func decrease() {
        number -= randomNumberBetween1And10()
    }
    
    func randomNumberBetween1And10() -> Int {
        Int.random(in: 1...10)
    }
}

#Preview {
    ContentView()
}
