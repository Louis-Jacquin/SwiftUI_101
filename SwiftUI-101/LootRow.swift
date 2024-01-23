//
//  LootRow.swift
//  SwiftUI-101
//
//  Created by Louis JACQUIN on 1/23/24.
//

import SwiftUI

struct LootRow: View {
    var item: LootItem
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Circle()
                    .fill(item.rarity.getColor())
                    .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                Text(item.name)
                Spacer()
                Text(item.type.rawValue)
            }
            Text("Quantité : " + String(item.quantity))
        }
    }
}
