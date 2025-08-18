//
//  HPTriviaApp.swift
//  HPTrivia
//
//  Created by masume çetin on 16.08.2025.
//

import SwiftUI

@main
struct HPTriviaApp: App {
    private var game : Game = Game()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(game)
        }
    }
}
/*
App development plan
 - game intro screen ✍︎
 - gameplay screen
 - game logic (questions,scores,etc) ✍︎
 - celebration
 - audio ✍︎
 - animations ✍︎
 - in app purchases
 - instruction screen ✔️
 - books ✍︎
 - persist scores ✍︎
*/
