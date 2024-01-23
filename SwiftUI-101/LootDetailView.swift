//
//  LootDetailView.swift
//  SwiftUI-101
//
//  Created by Louis JACQUIN on 1/19/24.
//

import SwiftUI

struct LootDetailView: View {
    @State var item: LootItem
    
    var body: some View {
        VStack {
            LootDetailTitle(item: item)
            LootDetailInformations(item: item)
        }
    }
}

#Preview {
    LootDetailView(item: LootItem(name: "Aubeclat", type: ItemType.fire, rarity: Rarity.unique, attackStrength: 20, game: availableGames[1]))
}


