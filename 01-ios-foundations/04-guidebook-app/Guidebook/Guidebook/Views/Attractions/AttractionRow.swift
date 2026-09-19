//
//  AttractionRow.swift
//  Guidebook
//
//  Created by Mohsin Ali Ayub on 18.09.26.
//

import SwiftUI

struct AttractionRow: View {
    let attraction: Attraction
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(attraction.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(attraction.name)
                .font(.title)
                .bold()
            Text(attraction.summary)
                .multilineTextAlignment(.leading)
        }
    }
}

#Preview {
    AttractionRow(attraction: DataService.fetchPreviewCity().attractions[0])
}
