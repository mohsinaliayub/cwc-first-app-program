//
//  DataService.swift
//  FootballStats
//
//  Created by Mohsin Ali Ayub on 24.09.26.
//

import Foundation

struct DataService {
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    private let teamsEndpoint = "https://api.football-data.org/v4/teams?limit=10"
    
    /// Fetch a collection of football teams.
    func fetchFootballTeams() async -> [FootballTeam] {
        guard let apiKey, let url = URL(string: teamsEndpoint) else { return [] }
        
        var request = URLRequest(url: url)
        request.addValue(apiKey, forHTTPHeaderField: "X-Auth-Token")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { return [] }
            
            let teamsData = try JSONDecoder().decode(FootballTeamsResult.self, from: data)
            return teamsData.teams
        } catch {
            print(error)
        }
        
        return []
    }
}
