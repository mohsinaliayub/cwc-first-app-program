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
                    MealView(meal: meal)
                }
            }
        }
    }
}

struct MealView: View {
    let meal: Meal
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Image(meal.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            dismissButton
        }
    }
    
    var dismissButton: some View {
        VStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "x.circle")
                    .scaleEffect(2)
                    .foregroundStyle(.black)
            }
            .padding()
            .padding(.top)
            
            Spacer()
        }
    }
}

#Preview {
    MealsView()
}

#Preview {
    MealView(meal: Meal(imageName: "3"))
}
