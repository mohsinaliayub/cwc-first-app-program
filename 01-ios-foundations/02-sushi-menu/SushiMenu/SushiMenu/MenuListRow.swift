//
//  MenuListRow.swift
//  SushiMenu
//
//  Created by Mohsin Ali Ayub on 16.09.26.
//

import SwiftUI

struct MenuListRow: View {
    let item: MenuItem
    
    var body: some View {
        HStack {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(item.name)
                .bold()
            
            Spacer()
            
            Text("$" + item.price)
        }
    }
}

#Preview {
    MenuListRow(item: MenuItem(name: "Onigiri", price: "1.99", imageName: "onigiri"))
}
