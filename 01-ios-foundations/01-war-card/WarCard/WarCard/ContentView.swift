//
//  ContentView.swift
//  WarCard
//
//  Created by Mohsin Ali Ayub on 15.09.26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("niagarafalls")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        
    }
}

#Preview {
    ContentView()
}
