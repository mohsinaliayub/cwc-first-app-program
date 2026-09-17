//
//  MenuView.swift
//  RestaurantApp
//
//  Created by Mohsin Ali Ayub on 17.09.26.
//

import SwiftUI

struct MenuView: View {
    @State private var menuItems: [MenuItem] = []
    
    var body: some View {
        List(menuItems) { item in
            MenuListRow(item: item)
        }
        .listStyle(.plain)
        .onAppear {
            let dataService = DataService()
            menuItems = dataService.fetchMenuItems()
        }
    }
}

#Preview {
    MenuView()
}
