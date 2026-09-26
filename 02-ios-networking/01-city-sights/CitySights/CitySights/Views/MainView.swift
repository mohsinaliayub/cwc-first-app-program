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
    
    var body: some View {
        @Bindable var model = model
        
        VStack(spacing: 0) {
            searchBar
            
            segmentedPickerView
            
            if selectedTab == 1 {
                MapView()
                    .padding(.top)
            } else {
                BusinessesListView()
            }
        }
        .task {
            model.searchBusinesses()
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
            }
        }
        .padding()
    }
}

#Preview {
    MainView()
        .environment(BusinessViewModel(dataService: DataService()))
}
