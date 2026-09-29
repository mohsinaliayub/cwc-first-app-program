//
//  LocationServicesDeniedView.swift
//  CitySights
//
//  Created by Mohsin Ali Ayub on 29.09.26.
//

import SwiftUI

struct LocationServicesDeniedView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Please allow location services for this app to see sights near you.")
                .multilineTextAlignment(.center)
            Button {
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(url)
                }
            } label: {
                Text("Open App Privacy Settings")
            }
            .buttonStyle(.bordered)
            
            Spacer()
        }
    }
}

#Preview {
    LocationServicesDeniedView()
}
