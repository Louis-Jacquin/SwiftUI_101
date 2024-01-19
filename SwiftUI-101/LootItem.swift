//
//  LootItem.swift
//  SwiftUI-101
//
//  Created by Louis JACQUIN on 1/19/24.
//

import Foundation
import SwiftUI
enum ItemType: String, CaseIterable {
    case magic = "⭐️"
    case fire = "🔥"
    case ice = "❄️"
    case wind = "💨"
    case poison = "☠️"
    case thunder = "⚡️"
    case dagger = "🗡️"
    case shield = "🛡️"
    case bow = "🏹"
    case ring = "💍"
    case unknown = "🎲"
}
enum Rarity: CaseIterable {
    case common
    case uncommon
    case rare
    case epic
    case legendary
    case unique
    
    func getColor() -> Color {
        switch self {
            case Rarity.common:
                return Color.gray
            case Rarity.uncommon:
                return Color.green
            case Rarity.rare:
                return Color.red
            case Rarity.epic:
                return Color.purple
            case Rarity.legendary:
                return Color.orange
            case Rarity.unique:
                return Color.yellow
        }
    }
}

struct LootItem: Identifiable {
    var id: String {
        self.name
    }
    var quantity : Int = 1
    var name : String
    var type : ItemType
    var rarity : Rarity
    var attackStrength : Int?
    var game : Game
}
