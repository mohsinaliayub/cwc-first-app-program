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
    @State private var selectedBusiness: Business?
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
        .sheet(item: $selectedBusiness) { business in
            BusinessDetailView(business: business)
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
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 12) {
                ForEach(businesses) { business in
                    BusinessInfoRow(business: business)
                        .onTapGesture {
                            selectedBusiness = business
                        }
                }
            }
            .padding(.top, 12)
        }
        .scrollIndicators(.hidden)
    }
}

struct BusinessInfoRow: View {
    let business: Business
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image("list-placeholder-image")
                    .padding(.trailing, 4)
                VStack(alignment: .leading, spacing: 4) {
                    Text(business.name.trimmingCharacters(in: .whitespacesAndNewlines))
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                    Text(TextHelper.distanceAwayText(meters: business.distance ?? 0))
                        .font(.system(size: 16))
                        .foregroundStyle(Color(red: 67/255, green: 71/255, blue: 76/255))
                }
                Spacer()
                Image("regular_\(business.rating ?? 0)")
            }
            Divider()
        }
    }
}


#Preview {
    MainView()
}
