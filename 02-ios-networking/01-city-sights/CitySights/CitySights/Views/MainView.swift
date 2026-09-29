//
//  MainView.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 23.09.26.
//

import SwiftUI
import CoreLocation

struct MainView: View {
    @Environment(BusinessViewModel.self) var model
    @State private var query = ""
    @State private var selectedTab = 0
    @State private var showOptions = false
    @FocusState private var queryBoxFocused: Bool
    
    var body: some View {
        @Bindable var model = model
        
        VStack(spacing: 0) {
            searchBar
            if showOptions {
                queryOptionsView
            }
            
            segmentedPickerView
            
            currentView
        }
        .onChange(of: queryBoxFocused) { _, newValue in
            withAnimation {
                showOptions = newValue
            }
        }
        .sheet(item: $model.selectedBusiness) { business in
            queryBoxFocused = false
            return BusinessDetailView(business: business)
        }
    }
    
    private var currentView: some View {
        ZStack {
            if model.locationAuthStatus == .denied {
                LocationServicesDeniedView()
            } else if selectedTab == 1 {
                MapView()
                    .padding(.top)
                    .onTapGesture {
                        queryBoxFocused = false
                    }
            } else {
                BusinessesListView()
                    .onTapGesture {
                        queryBoxFocused = false
                    }
            }
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
            TextField("What're you looking for?", text: $query)
                .focused($queryBoxFocused)
                .textFieldStyle(.roundedBorder)
            
            Button {
                queryBoxFocused = false
                model.searchBusinesses(for: query)
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
            optionToggles
            
            categoriesPicker
        }
        .padding(.horizontal, 32)
        .padding(.bottom, 8)
        .transition(.move(edge: .leading))
    }
    
    private var optionToggles: some View {
        VStack {
            @Bindable var model = model
            ForEach(model.searchOptions.indices, id: \.self) { index in
                Toggle(model.searchOptions[index].title, isOn: $model.searchOptions[index].isOn)
            }
        }
    }
    
    private var categoriesPicker: some View {
        HStack {
            @Bindable var model = model
            Text("Category")
            Spacer()
            Picker("Category", selection: $model.selectedCategory) {
                ForEach(model.categories) { category in
                    Text(category.title)
                        .tag(category)
                }
            }
        }
    }
}

#Preview {
    MainView()
        .environment(BusinessViewModel(dataService: DataService()))
}
