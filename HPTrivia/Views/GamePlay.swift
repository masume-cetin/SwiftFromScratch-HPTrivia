//
//  GamePlay.swift
//  HPTrivia
//
//  Created by masume çetin on 18.08.2025.
//

import SwiftUI

struct GamePlay: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(.hogwarts)
                    .resizable()
                    .frame(width: geo.size.width * 3,height: geo.size.height * 1.05)
                    .overlay {
                        Rectangle()
                            .foregroundStyle(.black.opacity(0.8))
                    }
                VStack {
                    // MARK: controls
                    
                    // MARK: question
                    
                    // MARK: hints
                    
                    // MARK: answers
                }
                .frame(width: geo.size.width,height: geo.size.height)
                
                // MARK: celebration
            }
            .frame(width: geo.size.width,height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GamePlay()
}
