//
//  ContentView.swift
//  WarCard
//
//  Created by Mohsin Ali Ayub on 15.09.26.
//

import SwiftUI

struct ContentView: View {
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
            Image("card2")
            Spacer()
            Image("card3")
            Spacer()
        }
    }
    
    var playerAndCPUScoreView: some View {
        HStack {
            Spacer()
            PlayerScoreView("Player", score: 0)
            Spacer()
            PlayerScoreView("CPU", score: 0)
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
        print("Deal cards")
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
