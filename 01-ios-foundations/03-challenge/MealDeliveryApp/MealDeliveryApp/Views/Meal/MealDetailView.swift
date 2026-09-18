//
//  MealDetailView.swift
//  MealDeliveryApp
//
//  Created by Mohsin Ali Ayub on 18.09.26.
//

import SwiftUI

struct MealDetailView: View {
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
    MealDetailView(meal: Meal(imageName: "3"))
}
