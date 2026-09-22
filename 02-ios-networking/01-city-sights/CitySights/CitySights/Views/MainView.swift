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
            searchBar.padding(.horizontal)
            businessesListView
        }
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
            VStack {
                HStack(alignment: .top) {
                    Image("list-placeholder-image")
                    VStack(alignment: .leading) {
                        Text(business.name)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Distance")
                            .font(.system(size: 16))
                            .foregroundStyle(Color(red: 67/255, green: 71/255, blue: 76/255))
                    }
                    Spacer()
                    Image("regular_\(business.rating ?? 0)")
                }
                Divider()
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    MainView()
}
