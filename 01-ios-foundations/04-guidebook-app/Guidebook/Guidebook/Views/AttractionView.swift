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
        ScrollView {
            VStack(alignment: .leading) {
                Image(attraction.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(attraction.name)
            }
            .padding()
        }
    }
}

#Preview {
    let attraction = DataService.fetchPreviewCity().attractions[0]
    AttractionView(attraction: attraction)
}
