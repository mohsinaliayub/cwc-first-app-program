//
//  MealsView.swift
//  MealDeliveryApp
//
//  Created by Mohsin Ali Ayub on 18.09.26.
//

import SwiftUI

struct MealsView: View {
    @State private var meals: [Meal] = []
    private let columns = Array(repeating: GridItem(spacing: 12), count: 2)
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(meals) { meal in
                            Image(meal.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                    .padding(.horizontal)
                }
                .scrollIndicators(.hidden)
                .navigationTitle("Our Meals")
                .onAppear {
                    let dataService = DataService()
                    meals = dataService.fetchMeals()
                }
            }
        }
    }
}

#Preview {
    MealsView()
}
