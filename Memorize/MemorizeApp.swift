//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Taiyang Lyu on 15/6/2024.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
