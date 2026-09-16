//
//  MenuView.swift
//  SushiMenu
//
//  Created by Mohsin Ali Ayub on 16.09.26.
//

import SwiftUI

struct MenuView: View {
    var menuItems = [MenuItem]()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    MenuView()
}
