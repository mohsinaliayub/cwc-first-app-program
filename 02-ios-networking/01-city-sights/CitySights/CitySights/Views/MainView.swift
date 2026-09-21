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
    private let dataService = DataService()
    
    var body: some View {
        VStack {
            searchBar
            businessesListView
        }
        .padding()
        .task {
            businesses = await dataService.searchRestaurants()
        }
    }
    
    private var searchBar: some View {
        HStack {
            TextField("What're you looking for?", text: $query)
                .textFieldStyle(.roundedBorder)
            Button {
                // TODO: Implement query search
            } label: {
                Text("Go")
            }
        }
    }
    
    private var businessesListView: some View {
        List(businesses) { business in
            Text(business.name)
        }
        .listStyle(.plain)
    }
}

#Preview {
    MainView()
}
