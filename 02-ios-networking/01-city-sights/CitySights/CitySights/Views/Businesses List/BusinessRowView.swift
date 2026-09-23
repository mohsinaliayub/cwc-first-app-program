//
//  BusinessRowView.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 23.09.26.
//

import SwiftUI

struct BusinessRowView: View {
    let business: Business
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image("list-placeholder-image")
                    .padding(.trailing, 4)
                VStack(alignment: .leading, spacing: 4) {
                    Text(business.name.trimmingCharacters(in: .whitespacesAndNewlines))
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                    Text(TextHelper.distanceAwayText(meters: business.distance ?? 0))
                        .font(.system(size: 16))
                        .foregroundStyle(Color(red: 67/255, green: 71/255, blue: 76/255))
                }
                Spacer()
                Image(ImageHelper.ratingImageName(for: business.rating ?? 0))
            }
            Divider()
        }
    }
}

#Preview {
    BusinessRowView(business: PreviewDataService().previewBusiness())
}
