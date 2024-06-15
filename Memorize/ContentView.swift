//
//  ContentView.swift
//  Memorize
//
//  Created by Taiyang Lyu on 15/6/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: false)
            CardView()
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
        }
        .foregroundColor(.orange)
        .padding()
    }
}
struct CardView: View {
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("☁️").font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            print("tapped")
            isFaceUp.toggle()
        }
    }
}
















#Preview {
    ContentView()
}
