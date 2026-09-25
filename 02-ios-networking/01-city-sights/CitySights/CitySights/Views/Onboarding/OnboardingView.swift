//
//  OnboardingView.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 25.09.26.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView {
            Rectangle().fill(.red)
            
            Rectangle().fill(.green)
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    OnboardingView()
}
