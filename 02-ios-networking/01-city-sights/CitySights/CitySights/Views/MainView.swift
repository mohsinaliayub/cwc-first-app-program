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
    @State private var selectedTab = 0
    @State private var dealsOn = false
    @State private var popularOn = false
    @State private var categorySelection = "restaurants"
    @State private var showOptions = true
    @FocusState private var queryBoxFocused: Bool
    
    var body: some View {
        @Bindable var model = model
        
        VStack(spacing: 0) {
            searchBar
            if showOptions {
                queryOptionsView
            }
            
            segmentedPickerView
            
            if model.locationAuthStatus == .denied {
                VStack {
                    Spacer()
                    Text("Please allow location services for this app to see sights near you.")
                        .multilineTextAlignment(.center)
                    Button {
                        if let url = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(url)
                        }
                    } label: {
                        Text("Open App Privacy Settings")
                    }
                    .buttonStyle(.bordered)
                    
                    Spacer()
                }
            } else if selectedTab == 1 {
                MapView()
                    .padding(.top)
                    .onTapGesture {
                        queryBoxFocused = false
                    }
            } else {
                BusinessesListView()
            }
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
                .focused($queryBoxFocused)
                .textFieldStyle(.roundedBorder)
            
            Button {
                queryBoxFocused = false
                model.searchBusinesses(query: model.query, options: getOptionsString(), category: categorySelection)
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
    
    private func getOptionsString() -> String {
        var optionsArray = [String]()
        if popularOn {
            optionsArray.append("hot_and_new")
        }
        if dealsOn {
            optionsArray.append("deals")
        }
        return optionsArray.joined(separator: ",")
    }
    
    private var queryOptionsView: some View {
        VStack {
            Toggle("Popular", isOn: $popularOn)
            Toggle("Deals", isOn: $dealsOn)
            
            HStack {
                Text("Category")
                Spacer()
                Picker("Category", selection: $categorySelection) {
                    ForEach(model.categories, id: \.alias) { category in
                        Text(category.title)
                            .tag(category.alias)
                    }
                }
            }
        }
        .padding(.horizontal, 32)
        .padding(.bottom, 8)
        .transition(.move(edge: .leading))
    }
}

#Preview {
    MainView()
        .environment(BusinessViewModel(dataService: DataService()))
}
