//
//  OnboardingScene.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 25.09.26.
//

import SwiftUI

struct OnboardingScene: View {
    let bgColor: Color
    let headline: String
    let subheadline: String
    let buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            bgColor
            VStack(spacing: 0) {
                Spacer()
                Spacer()
                
                Image("onboarding")
                    .padding(.bottom, 32)
                
                Text(headline)
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 4)
                
                Text(subheadline)
                    .multilineTextAlignment(.center)
                    .font(.callout)
                
                Spacer()
                
                continueButton
            }
            .foregroundStyle(.white)
            .padding(.horizontal)
        }
    }
    
    var continueButton: some View {
        Button {
            buttonAction()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .foregroundStyle(.white)
                Text("Continue")
                    .foregroundStyle(.black)
                    .bold()
            }
        }
        .frame(height: 50)
        .padding(.bottom, 115)
    }
}

#Preview {
    OnboardingScene(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255),
                    headline: "Welcome to City Sights",
                    subheadline: "City Sights helps you find the best of the city!") {
        
    }
                    .ignoresSafeArea()
}
