//
//  ContentView.swift
//  WarCard
//
//  Created by Mohsin Ali Ayub on 15.09.26.
//

import SwiftUI

struct ContentView: View {
    @State private var playerCard = "card7"
    @State private var cpuCard = "card13"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        ZStack {
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Image("logo")
                playerAndCPUCardsView
                dealCardsButton
                playerAndCPUScoreView
            }
        }
    }
    
    var playerAndCPUCardsView: some View {
        HStack {
            Spacer()
            Image(playerCard)
            Spacer()
            Image(cpuCard)
            Spacer()
        }
    }
    
    var playerAndCPUScoreView: some View {
        HStack {
            Spacer()
            PlayerScoreView("Player", score: playerScore)
            Spacer()
            PlayerScoreView("CPU", score: cpuScore)
            Spacer()
        }
        .foregroundStyle(.white)
    }
    
    var dealCardsButton: some View {
        Button {
            dealCards()
        } label: {
            Image("button")
        }
    }
    
    func dealCards() {
        // Randomize the player's card
        
        // Randomize the cpu's card
        
        // Update the scores
    }
    
    func randomCardNumber() -> Int {
        Int.random(in: 2...14)
    }
}

struct PlayerScoreView: View {
    let player: String
    let score: Int
    
    init(_ player: String, score: Int) {
        self.player = player
        self.score = score
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(player)
                .font(.headline)
            Text("\(score)")
                .font(.largeTitle)
        }
    }
}

#Preview {
    ContentView()
}
