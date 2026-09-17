//
//  AboutView.swift
//  RestaurantApp
//
//  Created by Mohsin Ali Ayub on 17.09.26.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    Image("restaurant-inside")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Text("Sukiyabashi Jiro (すきやばし次郎, Sukiyabashi Jirō) is a sushi restaurant in Ginza, Chūō, Tokyo, owned by Jiro Ono. \nSukiyabashi Jiro was the first sushi restaurant to receive three stars from the Michelin Guide. It was removed from the Michelin Guide in November 2019 as it does not receive reservations from the general public, instead requiring reservations to be made through the concierge of a luxury hotel.")
                    
                    Image("map")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Text("""
                         Tsukamoto Sogyo Building
                         Basement Floor 1
                         2-15, Ginza 4-chome
                         Chūō, Tokyo
                         """)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .scrollIndicators(.hidden)
            .navigationTitle("About")
        }
    }
}

#Preview {
    AboutView()
}
