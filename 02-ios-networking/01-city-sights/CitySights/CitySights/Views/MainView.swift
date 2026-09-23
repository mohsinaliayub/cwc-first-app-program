//
//  MainView.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 23.09.26.
//

import SwiftUI

struct MainView: View {
    @Environment(BusinessViewModel.self) var model
    
    var body: some View {
        VStack {
            searchBar
            
            // Show picker
            
            // Show map or list
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
        .padding()
    }
}

#Preview {
    MainView()
        .environment(BusinessViewModel(dataService: DataService()))
}
