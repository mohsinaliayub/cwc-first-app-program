//
//  FootballStatsApp.swift
//  FootballStats
//
//  Created by Mohsin Ali Ayub on 24.09.26.
//

import SwiftUI

@main
struct FootballStatsApp: App {
    @State private var teamsListViewModel = TeamsListViewModel(dataService: DataService())
    
    var body: some Scene {
        WindowGroup {
            TeamsListView()
                .environment(teamsListViewModel)
        }
    }
}
