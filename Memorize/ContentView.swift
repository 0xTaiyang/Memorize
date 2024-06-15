//
//  ContentView.swift
//  Memorize
//
//  Created by Taiyang Lyu on 15/6/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻","🎃","🕷️","😈","🐳","🦓","🎙️","🎥"]
    
    @State var CardCount: Int = 4

    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }.padding()
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            CardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<CardCount, id: \.self) { index in
                CardView(content:emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            CardCount += offset
        },label:{
            Image(systemName: symbol)
        })
        .disabled(CardCount + offset < 1 || CardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus")
    }
    
    var CardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1:0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
















#Preview {
    ContentView()
}
