//
//  MainView.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 23.09.26.
//

import SwiftUI

struct MainView: View {
    @Environment(BusinessViewModel.self) var model
    @State private var selectedTab = 0
    @State private var dealsOn = false
    @State private var popularOn = false
    @State private var categorySelection = "restaurants"
    
    var body: some View {
        @Bindable var model = model
        
        VStack(spacing: 0) {
            searchBar
            queryOptionsView
            
            segmentedPickerView
            
            if selectedTab == 1 {
                MapView()
                    .padding(.top)
            } else {
                BusinessesListView()
            }
        }
        .task {
            model.searchBusinesses(query: nil, options: nil, category: nil)
        }
        .sheet(item: $model.selectedBusiness) { business in
            BusinessDetailView(business: business)
        }
    }
    
    private var segmentedPickerView: some View {
        Picker("", selection: $selectedTab) {
            Text("List")
                .tag(0)
            Text("Map")
                .tag(1)
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)
    }
    
    private var searchBar: some View {
        HStack {
            @Bindable var model = model
            
            TextField("What're you looking for?", text: $model.query)
                .textFieldStyle(.roundedBorder)
            Button {
                // TODO: Implement query search
            } label: {
                Text("Go")
                    .bold()
                    .padding()
                    .frame(height: 32)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
        }
        .padding()
    }
    
    private var queryOptionsView: some View {
        VStack {
            Toggle("Popular", isOn: $popularOn)
            Toggle("Deals", isOn: $dealsOn)
            
            HStack {
                Text("Category")
                Spacer()
                Picker("Category", selection: $categorySelection) {
                    Text("Restaurants").tag("restaurants")
                    Text("Arts").tag("arts")
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
}

#Preview {
    MainView()
        .environment(BusinessViewModel(dataService: DataService()))
}
