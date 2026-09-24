//
//  TeamsListViewModel.swift
//  FootballStats
//
//  Created by Mohsin Ali Ayub on 24.09.26.
//

import Foundation

@Observable
class TeamsListViewModel {
    /// Data service to fetch teams.
    private let dataService: DataService
    /// Collection of football teams.
    var teams: [FootballTeam] = []
    
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    /// Retrieve collection of football teams from external data source.
    func fetchFootballTeams() async {
        teams = await dataService.fetchFootballTeams()
    }
}
