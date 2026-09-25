//
//  OnboardingView.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 25.09.26.
//

import SwiftUI

struct OnboardingView: View {
    @State private var selectedViewIndex = 0
    
    var body: some View {
        TabView(selection: $selectedViewIndex) {
            OnboardingScene(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255),
                            headline: "Welcome to City Sights",
                            subheadline: "City Sights helps you find the best of the city!") {
                withAnimation {
                    selectedViewIndex = 1
                }
            }
                            .ignoresSafeArea()
                            .tag(0)
            
            OnboardingScene(bgColor: Color(red: 139/255, green: 166/255, blue: 65/255),
                            headline: "Discover your City",
                            subheadline: "We'll show you the best restaurants, venues, and more, based on your location.") {
                
            }
                            .ignoresSafeArea()
                            .tag(1)
        }
        .tabViewStyle(.page)
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
