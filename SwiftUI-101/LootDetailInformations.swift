//
//  LootDetailInformations.swift
//  SwiftUI-101
//
//  Created by Louis JACQUIN on 1/23/24.
//

import Foundation
import SwiftUI

struct LootDetailInformations: View {
    var item: LootItem
    
    @State var isAnimated = false

    var body: some View {
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
        .rotationEffect(.degrees(isAnimated ? 7200 : 0))
        .scaleEffect(isAnimated ? 1 : 0)
        .animation(.bouncy.delay(0.2), value: isAnimated)
        .task {
            isAnimated = true
        }
    }
}
