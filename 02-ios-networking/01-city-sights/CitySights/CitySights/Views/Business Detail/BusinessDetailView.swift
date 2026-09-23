//
//  BusinessDetailView.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 22.09.26.
//

import SwiftUI

struct BusinessDetailView: View {
    let business: Business
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image("detail-placeholder-image")
                .resizable()
                .frame(height: 200)
                .overlay(alignment: .bottomTrailing) {
                    Image("yelp-attribution-image")
                }
            if let isClosed = business.isClosed {
                Rectangle()
                    .fill(isClosed ? .red : .green)
                    .frame(height: 36)
                    .overlay(alignment: .leading) {
                        Text(isClosed ? "Closed" : "Open")
                            .bold()
                            .foregroundStyle(.white)
                            .padding(.leading)
                    }
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text(business.name.trimmingCharacters(in: .whitespacesAndNewlines))
                        .font(.system(size: 21))
                        .bold()
                        .padding(.bottom, 10)
                    Text(address())
                        .padding(.bottom, 10)
                        .foregroundStyle(.secondary)
                    Image(ImageHelper.ratingImageName(for: business.rating ?? 0.0))
                        .padding(.bottom, 16)
                    Divider()
                    
                    HStack {
                        Image(systemName: "phone").frame(width: 24, height: 24)
                        Text(business.displayPhone ?? "No phone number")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "arrow.right")
                            .foregroundStyle(.blue)
                    }
                    .padding(.vertical, 16)
                    Divider()
                    HStack {
                        Image(systemName: "globe").frame(width: 24, height: 24)
                        Text(business.url ?? "No website")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(1)
                        Image(systemName: "arrow.right")
                            .foregroundStyle(.blue)
                    }
                    .padding(.vertical, 16)
                    Divider()
                    HStack {
                        Image(systemName: "bubble.left.and.bubble.right").frame(width: 24, height: 24)
                        Text(reviewString())
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "arrow.right")
                            .foregroundStyle(.blue)
                    }
                    .padding(.vertical, 16)
                    Divider()
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
    }
    
    private func reviewString() -> String {
            guard let reviewCount = business.reviewCount, reviewCount > 0 else { return "No reviews"}
            return "\(reviewCount) review\(reviewCount > 1 ? "s" : "")"
        }
        
        private func address() -> String {
            let addr = business.location?.address1 ?? ""
            let city = business.location?.city ?? ""
            let state = business.location?.state ?? ""
            let zip = business.location?.zipCode ?? ""
            let country = business.location?.country ?? ""
            
            return "\(addr), \(city)\n\(state) \(zip), \(country)"
        }
    
}

#Preview {
    let business = PreviewDataService().previewBusiness()
    BusinessDetailView(business: business)
}
