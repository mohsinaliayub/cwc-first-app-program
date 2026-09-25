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
    @AppStorage("onboarding") private var needsOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(businessViewModel)
                .fullScreenCover(isPresented: $needsOnboarding) {
                    needsOnboarding = false
                } content: {
                    OnboardingView()
                }
        }
    }
}
