//
//  BusinessImageView.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 27.09.26.
//

import SwiftUI

struct BusinessImageView: View {
    let imageURL: URL?
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        AsyncImage(url: imageURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        } placeholder: {
            ProgressView()
                .frame(width: width, height: height)
        }
    }
    
    init(for urlString: String, width: CGFloat = 50, height: CGFloat = 50) {
        self.imageURL = URL(string: urlString)
        self.width = width
        self.height = height
    }
}

#Preview {
    let business = PreviewDataService().previewBusiness()
    BusinessImageView(for: business.imageURL!)
}
