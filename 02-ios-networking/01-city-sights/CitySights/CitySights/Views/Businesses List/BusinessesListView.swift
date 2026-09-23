//
//  BusinessesListView.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 21.09.26.
//

import SwiftUI

struct BusinessesListView: View {
    @Environment(BusinessViewModel.self) private var model
    
    var body: some View {
        @Bindable var model = model
        
        VStack {
            searchBar
            businessesListView
        }
        .padding()
        .task {
            await model.searchBusinesses()
        }
        .sheet(item: $model.selectedBusiness) { business in
            BusinessDetailView(business: business)
        }
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
    }
    
    private var businessesListView: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 12) {
                ForEach(model.businesses) { business in
                    BusinessRowView(business: business)
                        .onTapGesture {
                            model.selectedBusiness = business
                        }
                }
            }
            .padding(.top, 12)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    BusinessesListView()
        .environment(BusinessViewModel(dataService: DataService()))
}
