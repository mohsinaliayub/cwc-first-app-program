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
                if let imageURLString = business.imageURL {
                    asyncImage(for: imageURLString)
                } else {
                    Image("list-placeholder-image")
                        .padding(.trailing, 4)
                }
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
    
    private func asyncImage(for urlString: String) -> some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        } placeholder: {
            ProgressView()
                .frame(width: 50, height: 50)
        }
        .padding(.trailing, 4)

    }
}

#Preview {
    BusinessRowView(business: PreviewDataService().previewBusiness())
}
