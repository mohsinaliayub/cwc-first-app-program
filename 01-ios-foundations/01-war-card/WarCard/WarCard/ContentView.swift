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
            Color.mint
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 12) {
                Image("niagarafalls")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                HStack(alignment: .bottom) {
                    Text("Niagara Falls")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            ForEach(1...5, id: \.self) { index in
                                // use half filled star as the final image
                                let starImage = index % 5 != 0 ? "star.fill" : "star.leadinghalf.filled"
                                Image(systemName: starImage)
                            }
                        }
                        
                        Text("(Reviews 361)")
                    }
                    .foregroundStyle(.orange)
                    .font(.caption)
                }
                
                Text("Come visit the falls for an experience of a lifetime.")
                
                HStack {
                    Spacer()
                    Image(systemName: "fork.knife")
                    Image(systemName: "binoculars.fill")
                }
                .foregroundStyle(.gray)
                .font(.caption)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.white)
                    .shadow(radius: 12)
            )
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
