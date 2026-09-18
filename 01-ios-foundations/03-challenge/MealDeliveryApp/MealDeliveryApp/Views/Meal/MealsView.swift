//
//  MealsView.swift
//  MealDeliveryApp
//
//  Created by Mohsin Ali Ayub on 18.09.26.
//

import SwiftUI

struct MealsView: View {
    @State private var meals: [Meal] = []
    @State private var selectedMeal: Meal?
    private let columns = Array(repeating: GridItem(spacing: 12), count: 2)
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                let width = proxy.size.width
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(meals) { meal in
                            Image(meal.imageName)
                                .resizable()
                                .aspectRatio(2/1.5, contentMode: .fill)
                                .frame(maxWidth: width > 0 ? (width - 44) / 2 : .zero)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .onTapGesture {
                                    selectedMeal = meal
                                }
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
                .sheet(item: $selectedMeal) { meal in
                    MealDetailView(meal: meal)
                }
            }
        }
    }
}

#Preview {
    MealsView()
}
