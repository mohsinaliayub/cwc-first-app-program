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
        Text(business.name)
    }
}

#Preview {
    let business = PreviewDataService().previewBusiness()
    BusinessDetailView(business: business)
}
