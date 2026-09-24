//
//  TeamRowView.swift
//  FootballStats
//
//  Created by Mohsin Ali Ayub on 24.09.26.
//

import SwiftUI

struct TeamRowView: View {
    let team: FootballTeam
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 16) {
                crestView
                titleAndWebsiteView
                Spacer()
            }
            Divider()
        }
    }
    
    private var crestView: some View {
        AsyncImage(url: URL(string: team.crest)) { image in
            image.resizable()
        } placeholder: {
            RoundedRectangle(cornerRadius: 10)
        }
        .frame(width: 60, height: 60)
        .aspectRatio(contentMode: .fit)
    }
    
    private var titleAndWebsiteView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(team.name)
                .font(.headline)
            Text(team.website)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    let team = DummyDataService().fetchPreviewTeam()
    TeamRowView(team: team)
}
