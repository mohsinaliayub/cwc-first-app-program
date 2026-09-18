//
//  CityCardView.swift
//  Guidebook
//
//  Created by Mohsin Ali Ayub on 18.09.26.
//

import SwiftUI

struct CityCardView: View {
    let city: City
    
    var body: some View {
        ZStack {
            let roundedRectangle = RoundedRectangle(cornerRadius: 15)
            
            Rectangle()
                .background {
                    Image(city.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .foregroundStyle(.clear)
                .clipShape(roundedRectangle)
            
            roundedRectangle
                .fill(Color.black.opacity(0.5))
            
            VStack(alignment: .leading) {
                Text(city.name)
                    .font(.largeTitle)
                    .bold()
                Spacer()
                Text(city.summary)
                    .multilineTextAlignment(.leading)
            }
            .foregroundStyle(.white)
            .padding()
        }
        .frame(height: 400)
    }
}

#Preview {
    CityCardView(city: DataService.fetchPreviewCity())
}
