//
//  DummyDataService.swift
//  FootballStats
//
//  Created by Mohsin Ali Ayub on 24.09.26.
//

import Foundation

struct DummyDataService {
    private var teams: [FootballTeam] = []
    
    mutating func fetchTeams() -> [FootballTeam] {
        if teams.isEmpty {
            teams = loadTeamsDataFileContent()
        }
        
        return teams
    }
    
    mutating func fetchPreviewTeam() -> FootballTeam {
        guard teams.isEmpty else { return teams[0] }
        return fetchTeams()[0]
    }
    
    private func loadTeamsDataFileContent() -> [FootballTeam] {
        guard let url = Bundle.main.url(forResource: "teamsdata", withExtension: "json") else {
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            
            let result = try JSONDecoder().decode(FootballTeamsResult.self, from: data)
            return result.teams
        } catch {
            print(error)
        }
        
        return []
    }
}
