//
//  NiagaraFallsCardView.swift
//  WarCard
//
//  Created by Mohsin Ali Ayub on 15.09.26.
//

import SwiftUI

struct NiagaraFallsCardView: View {
    var body: some View {
        ZStack {
            Color.mint
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 12) {
                Image("niagarafalls")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                titleWithStarReviews
                
                Text("Come visit the falls for an experience of a lifetime.")
                
                bottomRightBlock
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
    
    private var titleWithStarReviews: some View {
        HStack(alignment: .bottom) {
            Text("Niagara Falls")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            
            reviewBlock
        }
    }
    
    private var reviewBlock: some View {
        VStack {
            starImages
            Text("(Reviews 361)")
        }
        .foregroundStyle(.orange)
        .font(.caption)
    }
    
    private var starImages: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                // use half filled star as the final image
                let starImage = index % 5 != 0 ? "star.fill" : "star.leadinghalf.filled"
                Image(systemName: starImage)
            }
        }
    }
    
    private var bottomRightBlock: some View {
        HStack {
            Spacer()
            Image(systemName: "fork.knife")
            Image(systemName: "binoculars.fill")
        }
        .foregroundStyle(.gray)
        .font(.caption)
    }
}

#Preview {
    NiagaraFallsCardView()
}
