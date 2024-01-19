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
            VStack {
                ZStack {
                    Rectangle()
                        .fill(item.rarity.getColor())
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                    Text(item.type.rawValue)
                        .font(.system(size: 80))
                }
                Text(item.name)
                    .font(.title)
                    .foregroundColor(item.rarity.getColor())
                    .bold()
            }
            .frame(height: 300)
            
            if(item.rarity == Rarity.unique) {
                Text("Objet Unique 🏆")
                    .foregroundColor(.white)
                    .frame(minWidth: 80, maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                    .background(Rarity.unique.getColor())
                    .cornerRadius(20)
                    .padding(10)
            }
            
            List {
                Section {
                    HStack {
                        Image(item.game.coverName!)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 58)
                            .cornerRadius(4)
                        Text(item.game.name)
                    }
                    HStack {
                        Text("In-game :")
                        Text(item.name)
                    }
                    if(item.attackStrength != nil) {
                        HStack {
                            Text("Puissance (ATQ) :")
                            Text(String(item.attackStrength!))
                        }
                    }
                    HStack {
                        Text("Possédé(s) :")
                        Text(String(item.quantity))
                    }
                    HStack {
                        Text("Rareté :")
                        Text(String(describing: item.rarity).capitalized)
                    }
                } header: {
                    Text("Information")
                }
            }
        }
    }
}

#Preview {
    LootDetailView(item: LootItem(name: "Aubeclat", type: ItemType.fire, rarity: Rarity.unique, attackStrength: 20, game: availableGames[1]))
}
