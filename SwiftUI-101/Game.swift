//
//  Game.swift
//  SwiftUI-101
//
//  Created by Louis JACQUIN on 1/19/24.
//

import Foundation

enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
}

let availableGames = [
    Game(name: "Elden Ring", genre: .rpg, coverName: "enlenringCover"),
    Game(name: "Skyrim", genre: .rpg, coverName: "skyrimCover"),
    Game(name: "WoW", genre: .mmorpg, coverName: "wowCover"),
    Game(name: "CS:GO", genre: .fps, coverName: "csgoCover"),
    Game(name: "Diablo IV", genre: .looter, coverName: "diabloCover")
]
