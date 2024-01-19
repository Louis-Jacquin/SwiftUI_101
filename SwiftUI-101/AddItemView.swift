//
//  AddItemView.swift
//  SwiftUI-101
//
//  Created by Louis JACQUIN on 1/19/24.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) private var dismiss
    
    var range = 0...10000
    var step = 1
    
    @State var name: String = ""
    @State var rarity: Rarity = Rarity.common
    @State var game: Game = Game.emptyGame
    @State var quantity: Int = 0
    @State var type: ItemType = ItemType.unknown
    @State private var attackItem = false
    @State var attack: Int = 0
    
    @EnvironmentObject var inventory: Inventory
    
    var body: some View {
        Form {
            Section {
                TextField("Nom de l'objet", text: $name)
                Picker("Rarete", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            Section {
                Picker("Jeu", selection: $game) {
                    Text("Non spécifié")
                    ForEach(availableGames, id: \.self) { game in
                        Text(String(describing: game.name).capitalized)
                    }
                }
                Stepper(value: $quantity, in: range, step: step) {
                    Text("Quantité : \(quantity)")
                }
            }
            Section {
                VStack {
                    HStack{
                        Text("Type")
                        Spacer()
                        Text(type.rawValue)
                    }
                    Picker("Type", selection: $type) {
                        ForEach(ItemType.allCases, id: \.self) { type in
                            Text(String(describing: type.rawValue).capitalized)
                        }
                    }
                    .pickerStyle(.palette)
                }
            }
            Section {
                Toggle(isOn: $attackItem) {
                        Text("Item d'attaque")
                    }
                if(attackItem) {
                    Stepper(value: $attack, in: range, step: step) {
                        Text("Quantité : \(attack)")
                    }
                }
            }
            Button(action: {
                inventory.addItem(item: LootItem(quantity: quantity, name: name, type: type, rarity: rarity, attackStrength: attack, game: game))
                dismiss()
              }, label: {
                Text("Ajouter")
            })
        }
    }
}

#Preview {
    AddItemView()
}
