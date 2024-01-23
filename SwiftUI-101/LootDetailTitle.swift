//
//  LootDetailTitle.swift
//  SwiftUI-101
//
//  Created by Louis JACQUIN on 1/23/24.
//

import Foundation
import SwiftUI

struct LootDetailTitle: View {
    var item: LootItem
    
    @State var isAnimated = false
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(item.rarity.getColor())
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                    Text(item.type.rawValue)
                        .font(.system(size: 80))
                }
                .rotation3DEffect(
                    .degrees(isAnimated ? 360 : 0),
                    axis: (x: 1.0, y: 0.5, z: 0.0)
                )
                .animation(.spring.delay(0.4), value: isAnimated)
                .shadow(color: item.rarity.getColor(), radius: isAnimated ? 100 : 0)
                .animation(.bouncy.delay(0.6).speed(0.5), value: isAnimated)
                .task {
                    isAnimated = true
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
                    .scaleEffect(isAnimated ? 1 : 0)
                    .animation(.bouncy.delay(0.8), value: isAnimated)
            }
        }
    }
}
