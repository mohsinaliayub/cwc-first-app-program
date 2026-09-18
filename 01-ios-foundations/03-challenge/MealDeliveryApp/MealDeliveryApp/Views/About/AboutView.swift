//
//  AboutView.swift
//  MealDeliveryApp
//
//  Created by Mohsin Ali Ayub on 18.09.26.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Sed non consequat dolor. Aenean vulputate enim a velit tempor, placerat dignissim nulla dapibus. Proin rhoncus nunc leo. Integer vel massa eget erat rutrum laoreet. Nullam mi orci, scelerisque vitae pharetra sit amet, elementum in felis. Quisque tincidunt cursus erat eu accumsan. Aliquam vel erat hendrerit, sodales lorem id, blandit tortor. Maecenas molestie neque urna, vel aliquam mi viverra nec. Nulla non ante ut dui hendrerit tempus. Sed euismod nec lorem in maximus. Proin pharetra nisi ut convallis mollis. Donec at enim a mi congue cursus nec euismod eros. Aenean ultricies rutrum libero, at bibendum nunc suscipit ut. Sed metus turpis, elementum ut turpis ut, dignissim hendrerit dolor. Nulla sed porttitor tortor. Fusce augue purus, iaculis vel ligula id, pharetra dictum libero.")
                    .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Our Story")
        }
    }
}

#Preview {
    AboutView()
}
