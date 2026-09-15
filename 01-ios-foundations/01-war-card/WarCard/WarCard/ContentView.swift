//
//  ContentView.swift
//  WarCard
//
//  Created by Mohsin Ali Ayub on 15.09.26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image("niagarafalls")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            HStack {
                Text("Niagara Falls")
                    .font(.title)
                    .fontWeight(.bold)
            }
            
            Text("Come visit the falls for an experience of a lifetime.")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
