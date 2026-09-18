//
//  MainView.swift
//  MealDeliveryApp
//
//  Created by Mohsin Ali Ayub on 18.09.26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Meals", systemImage: "fork.knife.circle.fill") {
                MealsView()
            }
            
            Tab("About", systemImage: "info.circle") {
                AboutView()
            }
        }
    }
}

#Preview {
    MainView()
}
