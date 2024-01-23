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
    
    @State private var presentAlert = false
    @State private var messageAlert = ""
    
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
                if(!name.isEmpty && name.count >= 3 && type != ItemType.unknown && game != Game.emptyGame) {
                    inventory.addItem(item: LootItem(quantity: quantity, name: name, type: type, rarity: rarity, attackStrength: attack, game: game))
                    dismiss()
                } else {
                    presentAlert = true
                    
                    messageAlert = ""
                    if(name.isEmpty || name.count <= 3) {
                        messageAlert += "Le nom doit posséder au moins 3 caractères "
                    }
                    if(type == ItemType.unknown) {
                        messageAlert += " le type ne doit pas être indéfini "
                    }
                    if(game == Game.emptyGame) {
                        messageAlert += " le jeu dois être renseigné"
                    }
                }
              }, label: {
                Text("Ajouter")
              })
        }.alert(messageAlert, isPresented: $presentAlert, actions: {})
    }
}

#Preview {
    AddItemView()
}
