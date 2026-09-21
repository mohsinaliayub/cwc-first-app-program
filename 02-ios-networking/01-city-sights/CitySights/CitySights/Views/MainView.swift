//
//  MainView.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 21.09.26.
//

import SwiftUI

struct MainView: View {
    @State private var query = ""
    @State private var businesses: [Business] = []
    
    var body: some View {
        HStack {
            TextField("What're you looking for?", text: $query)
                .textFieldStyle(.roundedBorder)
            Button {
                // TODO: Implement query search
                Task {
                    let dataService = DataService()
                    businesses = await dataService.searchRestaurants()
                    print(businesses.count)
                }
            } label: {
                Text("Go")
            }
        }
        .padding()
    }
}

#Preview {
    MainView()
}
