//
//  RecentScore.swift
//  HPTrivia
//
//  Created by masume çetin on 16.08.2025.
//

import SwiftUI

struct RecentScore: View {
    @Binding var animateViewsIn: Bool
    @Environment(Game.self) private var game
    var body: some View {
        VStack{
            if animateViewsIn {
                VStack{
                    Text("Recent Scores")
                        .font(.title2)
                    ForEach(game.recentScores,id:\.self){score in
                        Text("\(score)")
                    }
                }
                .font(.title3)
                .foregroundStyle(.white)
                .padding()
                .background(Color.black.opacity(0.7))
                .clipShape(.rect(cornerRadius: 15))
                .transition(.opacity)
            }}
        .animation(.linear(duration: 1).delay(4),value: animateViewsIn)
    }
}

#Preview {
    RecentScore(animateViewsIn: .constant(true))
        .environment(Game())
}
