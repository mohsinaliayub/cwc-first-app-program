//
//  SwiftUIListChallenge.swift
//  SushiMenu
//
//  Created by Mohsin Ali Ayub on 16.09.26.
//

import SwiftUI

struct SwiftUIListChallenge: View {
    @State private var items = ["McLaren", "Ferrari", "Lamborghini", "Rolls Royce", "Bentley"]
    private let randomWords = ["Koenigsegg", "Audi", "BMW", "Porsche", "Volkswagen", "Toyota", "Honda", "Ford"]
    
    var body: some View {
        List(items.indices, id: \.self) { index in
            Text(items[index])
        }
        Button("Add Row") {
            addRandomWordToItems()
        }
    }
    
    func addRandomWordToItems() {
        let randomIndex = Int.random(in: randomWords.indices)
        let randomWord = randomWords[randomIndex]
        
        items.append(randomWord)
    }
}

#Preview {
    SwiftUIListChallenge()
}
