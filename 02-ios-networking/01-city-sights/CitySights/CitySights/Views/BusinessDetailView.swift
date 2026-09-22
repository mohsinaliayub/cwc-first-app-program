//
//  BusinessDetailView.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 22.09.26.
//

import SwiftUI

struct BusinessDetailView: View {
    var business: Business?
    
    var body: some View {
        Text(business?.name ?? "NO-NAME")
    }
}

#Preview {
    BusinessDetailView()
}
