//
//  ContentView.swift
//  WarCard
//
//  Created by Mohsin Ali Ayub on 15.09.26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Image("logo")
                
                HStack {
                    Spacer()
                    Image("card2")
                    Spacer()
                    Image("card3")
                    Spacer()
                }
                
                Button(action: { }) {
                    Image("button")
                }
                
                HStack {
                    Spacer()
                    VStack(spacing: 20) {
                        Text("Player")
                        Text("0")
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        Text("CPU")
                        Text("0")
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                }
                .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    ContentView()
}
