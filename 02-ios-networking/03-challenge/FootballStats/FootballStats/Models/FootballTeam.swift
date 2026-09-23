//
//  FootballTeam.swift
//  FootballStats
//
//  Created by Mohsin Ali Ayub on 24.09.26.
//

import Foundation

/// Represens a football club or national football team.
struct FootballTeam {
    /// Unique identifier for the team.
    let id: Int
    /// Name of the club or team.
    let name: String
    /// Official crest of the club or team.
    let crest: String
}

extension FootballTeam: Identifiable { }

extension FootballTeam: Decodable { }
