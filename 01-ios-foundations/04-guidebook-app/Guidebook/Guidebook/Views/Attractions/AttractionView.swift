//
//  AttractionView.swift
//  Guidebook
//
//  Created by Mohsin Ali Ayub on 18.09.26.
//

import SwiftUI

struct AttractionView: View {
    let attraction: Attraction
    private let mapsHelper = MapsHelper()
    
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
                        
                        if mapsHelper.canOpenMap(for: attraction) {
                            getDirectionsButton
                                .padding(.top)
                        }
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
    
    private var getDirectionsButton: some View {
        Button {
            mapsHelper.openMap(for: attraction)
        } label: {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.blue)
                .frame(height: 48)
                .overlay {
                    Text("Get Directions")
                        .foregroundStyle(.white)
                }
        }
    }
}

#Preview {
    let attraction = DataService.fetchPreviewCity().attractions[1]
    AttractionView(attraction: attraction)
}
