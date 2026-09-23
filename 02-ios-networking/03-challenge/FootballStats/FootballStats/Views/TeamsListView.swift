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
            VStack(alignment: .leading, spacing: 12) {
                ForEach(teams) { team in
                    HStack(alignment: .top, spacing: 16) {
                        AsyncImage(url: URL(string: team.crest)) { image in
                            image.resizable()
                        } placeholder: {
                            RoundedRectangle(cornerRadius: 10)
                        }
                        .frame(width: 60, height: 60)
                        .aspectRatio(contentMode: .fit)
                        Text(team.name)
                            .font(.headline)
                        Spacer()
                    }
                    Divider()
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    TeamsListView()
}
