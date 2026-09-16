//
//  MenuView.swift
//  SushiMenu
//
//  Created by Mohsin Ali Ayub on 16.09.26.
//

import SwiftUI

struct MenuView: View {
    @State private var menuItems: [MenuItem] = []
    private let dataService = DataService()
    
    var body: some View {
        List(menuItems) { item in
            MenuListRow(item: item)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.brown.opacity(0.1))
        }
        .listStyle(.plain)
        .onAppear {
            menuItems = dataService.fetchMenuItems()
        }
    }
}

#Preview {
    MenuView()
}
