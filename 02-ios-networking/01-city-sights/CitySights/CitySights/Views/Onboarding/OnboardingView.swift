//
//  OnboardingView.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 25.09.26.
//

import SwiftUI

struct OnboardingView: View {
    private let blueColor = Color(red: 111/255, green: 154/255, blue: 189/255)
    private let greenColor = Color(red: 139/255, green: 166/255, blue: 65/255)
    @State private var selectedViewIndex = 0
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            if selectedViewIndex == 0 {
                blueColor
            } else {
                greenColor
            }
            
            pagedTabView
            
            VStack {
                Spacer()
                HStack(spacing: 16) {
                    Circle().frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 0 ? .white : .gray)
                    Circle().frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 1 ? .white : .gray)
                }
                .foregroundStyle(.white)
                .padding(.bottom, 220)
            }
        }
        .ignoresSafeArea()
    }
    
    private var pagedTabView: some View {
        TabView(selection: $selectedViewIndex) {
            OnboardingScene(bgColor: blueColor,
                            headline: "Welcome to City Sights",
                            subheadline: "City Sights helps you find the best of the city!") {
                withAnimation {
                    selectedViewIndex = 1
                }
            }
                            .ignoresSafeArea()
                            .tag(0)
            
            OnboardingScene(bgColor: greenColor,
                            headline: "Discover your City",
                            subheadline: "We'll show you the best restaurants, venues, and more, based on your location.") {
                dismiss()
            }
                            .ignoresSafeArea()
                            .tag(1)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

#Preview {
    OnboardingView()
}
