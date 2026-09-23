//
//  CitySightsApp.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 21.09.26.
//

import SwiftUI

@main
struct CitySightsApp: App {
    @State var businessViewModel = BusinessViewModel(dataService: DataService())
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(businessViewModel)
        }
    }
}
