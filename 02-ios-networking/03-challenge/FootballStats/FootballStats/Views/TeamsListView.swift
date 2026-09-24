//
//  TeamsListView.swift
//  FootballStats
//
//  Created by Mohsin Ali Ayub on 24.09.26.
//

import SwiftUI

struct TeamsListView: View {
    @State private var teams: [FootballTeam] = []
    private let service = DataService()
    
    var body: some View {
        VStack(alignment: .leading) {
            listView
        }
        .task {
            teams = await service.fetchFootballTeams()
        }
        .padding()
    }
    
    private var listView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(teams) { team in
                    TeamRowView(team: team)
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    TeamsListView()
}
