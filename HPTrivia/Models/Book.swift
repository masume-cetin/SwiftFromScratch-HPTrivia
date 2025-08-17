//
//  Book.swift
//  HPTrivia
//
//  Created by masume çetin on 17.08.2025.
//

struct Book : Identifiable {
    let id : Int
    let image : String
    let questions : [Question]
    var status : BookStatus

}

enum BookStatus : String {
    case active,inactive,locked
}
