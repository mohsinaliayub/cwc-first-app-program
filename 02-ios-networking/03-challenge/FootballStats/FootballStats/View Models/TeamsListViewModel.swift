//
//  TeamsListViewModel.swift
//  FootballStats
//
//  Created by Mohsin Ali Ayub on 24.09.26.
//

import Foundation

@Observable
class TeamsListViewModel {
    private let dataService = DataService()
    var teams: [FootballTeam] = []
    
    func fetchFootballTeams() async {
        teams = await dataService.fetchFootballTeams()
    }
}
