//
//  Question.swift
//  HPTrivia
//
//  Created by masume çetin on 16.08.2025.
//

struct Question : Decodable {
    let id :Int
    let question :String
    let answer :String
    let wrong : [String]
    let book :Int
    let hint : String

}
