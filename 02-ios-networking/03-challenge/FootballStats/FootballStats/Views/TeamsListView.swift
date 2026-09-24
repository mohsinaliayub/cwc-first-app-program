//
//  TeamsListView.swift
//  FootballStats
//
//  Created by Mohsin Ali Ayub on 24.09.26.
//

import SwiftUI

struct TeamsListView: View {
    @Environment(TeamsListViewModel.self) private var model
    
    var body: some View {
        VStack(alignment: .leading) {
            listView
        }
        .task {
            await model.fetchFootballTeams()
        }
        .padding()
    }
    
    private var listView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(model.teams) { team in
                    TeamRowView(team: team)
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    TeamsListView()
        .environment(TeamsListViewModel(dataService: DataService()))
}
