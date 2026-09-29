//
//  SearchOptions.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 29.09.26.
//

import Foundation

/// Enhance query search with search options.
struct SearchOption {
    /// A unique identifier for the option.
    let id: String
    /// The name of search option.
    let title: String
    /// A flag indicating the option's state.
    var isOn: Bool = false
}

extension SearchOption: Identifiable { }
