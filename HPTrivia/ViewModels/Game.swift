//
//  Game.swift
//  HPTrivia
//
//  Created by masume çetin on 17.08.2025.
//

import SwiftUI

@Observable
class Game {
    var bookQuestions = BookQuestions()
    var gameScore = 0
    var questionScore = 5
    var recentScores: [Int] = [0,0,0]
    var activeQuestions : [Question] = []
    var answeredQuestions : [Int] = []
    var currentQuestion = try! JSONDecoder().decode([Question].self,from: Data(contentsOf: Bundle.main.url(forResource: "trivia", withExtension: "json")!)).first!
    var answers : [String] = []
    
    func startGame() {
        for book in bookQuestions.books {
            if book.status == .active {
                for question in book.questions {
                    activeQuestions.append(question)
                }
            }
            newQuestion()
        }
    }
    func newQuestion() {
        
    }
    func correct() {
        
    }
    func endGame() {
        recentScores[2] = recentScores[1]
        recentScores[1] = recentScores[0]
        recentScores[0] = gameScore
        gameScore = 0
        activeQuestions.removeAll()
        answeredQuestions.removeAll()
    }
}
