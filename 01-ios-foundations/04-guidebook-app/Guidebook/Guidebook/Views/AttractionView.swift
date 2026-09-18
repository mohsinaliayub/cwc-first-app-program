//
//  AttractionView.swift
//  Guidebook
//
//  Created by Mohsin Ali Ayub on 18.09.26.
//

import SwiftUI

struct AttractionView: View {
    let attraction: Attraction
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 10) {
                Image(attraction.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(attraction.name)
                            .font(.title)
                            .bold()
                        Text(attraction.longDescription)
                            .multilineTextAlignment(.leading)
                    }
                    .frame(maxWidth: proxy.size.width)
                    .padding(.bottom, 30)
                    .padding(.horizontal)
                }
                .scrollIndicators(.hidden)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    let attraction = DataService.fetchPreviewCity().attractions[1]
    AttractionView(attraction: attraction)
}
