//
//  MenuView.swift
//  SushiMenu
//
//  Created by Mohsin Ali Ayub on 16.09.26.
//

import SwiftUI

struct MenuView: View {
    @State private var menuItems: [MenuItem] = []
    let dataService = DataService()
    
    var body: some View {
        List(menuItems) { item in
            HStack {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(item.name)
                    .bold()
                
                Spacer()
                
                Text("$" + item.price)
            }
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
