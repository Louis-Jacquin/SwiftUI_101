//
//  ContentView.swift
//  SwiftUI-101
//
//  Created by Louis JACQUIN on 1/19/24.
//

import SwiftUI

class Inventory: ObservableObject {
    @Published var loot: [LootItem] = [
        LootItem(name: "Aubeclat", type: ItemType.fire, rarity: Rarity.legendary, game: availableGames[1]),
        LootItem(quantity: 51, name: "Dague de fer", type: ItemType.dagger, rarity: Rarity.common, game: availableGames[1]),
        LootItem(quantity: 3, name: "Arc long", type: ItemType.bow, rarity: Rarity.uncommon, game: availableGames[1])
    ]
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
}

struct ContentView: View {
    @State var showAddItemView: Bool = false
    @StateObject var inventory = Inventory()

    var body: some View {
        NavigationStack {
            List {
                ForEach(inventory.loot, id: \.id) { item in
                    NavigationLink {
                        LootDetailView(item: item)
                    } label: {
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
            }
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView()
                    .environmentObject(inventory)
            })
            .navigationBarTitle("Loot") // Notre titre de page, choisissez le titre que vous voulez
                .toolbar(content: { // La barre d'outil de notre page
                    ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                        Button(action: {
                            showAddItemView.toggle() // L'action de notre bouton
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                        })
                    }
                })
        }
    }
}

#Preview {
    ContentView()
}
