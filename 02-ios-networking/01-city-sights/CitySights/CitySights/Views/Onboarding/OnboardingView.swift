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
            ZStack {
                Color(red: 111/255, green: 154/255, blue: 189/255)
                VStack(spacing: 0) {
                    Spacer()
                    Spacer()
                    
                    Image("onboarding")
                        .padding(.bottom, 32)
                    
                    Text("Welcome to City Sights")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 4)
                    
                    Text("City Sights helps you find the best of the city!")
                    
                    Spacer()
                    
                    Button {
                        // TODO
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
                    .padding(.horizontal)
                    .padding(.bottom, 115)
                }
                .foregroundStyle(.white)
            }
            .ignoresSafeArea()
        }
        .tabViewStyle(.page)
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
