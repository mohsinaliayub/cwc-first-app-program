//
//  MainView.swift
//  RestaurantApp
//
//  Created by Mohsin Ali Ayub on 17.09.26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Menu", systemImage: "menucard") {
                MenuView()
            }

            Tab("About", systemImage: "info.circle") {
                AboutView()
            }
            
            Tab("Gallery", systemImage: "photo") {
                GalleryView()
            }
        }
    }
}

#Preview {
    MainView()
}
