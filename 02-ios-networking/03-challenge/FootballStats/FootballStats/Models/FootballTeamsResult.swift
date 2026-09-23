//
//  FootballTeamsResult.swift
//  FootballStats
//
//  Created by Mohsin Ali Ayub on 24.09.26.
//

import Foundation

struct FootballTeamsResult {
    let count: Int
    let teams: [FootballTeam]
}

extension FootballTeamsResult: Decodable { }
