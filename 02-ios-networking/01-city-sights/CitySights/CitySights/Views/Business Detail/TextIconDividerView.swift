//
//  TextIconDividerView.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 23.09.26.
//

import SwiftUI

struct TextIconDividerView: View {
    let systemName: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: systemName).frame(width: 24, height: 24)
            Text(text)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
            Image(systemName: "arrow.right")
                .foregroundStyle(.blue)
        }
        .padding(.vertical, 16)
        Divider()
    }
}

#Preview {
    TextIconDividerView(systemName: "phone", text: "+81 3-6264-2990")
        .padding(.horizontal)
}
