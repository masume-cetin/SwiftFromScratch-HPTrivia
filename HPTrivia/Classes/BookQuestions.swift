//
//  BookQuestions.swift
//  HPTrivia
//
//  Created by masume çetin on 17.08.2025.
//

import Foundation

@Observable
class BookQuestions{
    var books : [Book] = []
    let savePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appending(path: "BookStatuses")
    
    init (){
        loadStatus()
    }
    
    private func decodeQuestions() -> [Question]{
        var decodedQuestions : [Question] = []
        if let url = Bundle.main.url(forResource: "trivia", withExtension: "json"){
            do{
                let data = try Data(contentsOf: url)
                decodedQuestions = try JSONDecoder().decode([Question].self, from: data)
            }
            catch{
                print("error decoding json data \(error)")
            }
        }
        return decodedQuestions
    }
    private func organizeQuestions(_ questions : [Question]) -> [[Question]]{
        var organizedQuestions : [[Question]] = []
        organizedQuestions = [[],[],[],[],[],[],[],[]]
        
        for question in questions {
            organizedQuestions[question.book].append(question)
        }
        
        
        return organizedQuestions
    }
    
    private func populateBooks(with questions : [[Question]]){
        for (index, question) in questions.enumerated(){
            if index == 1 || index == 2 {
                books.append(Book(id: index, image: "hp\(index)", questions: question, status: .active))
              }
           else if(index == 3){
                books.append(Book(id: index, image: "hp\(index)", questions: question, status: .inactive))}
            else if index > 3{
                books.append(Book(id: index, image: "hp\(index)", questions: question, status: .locked))
            }
        }
    }
    func changeStatus (of id: Int, to status : BookStatus){
        books[id-1].status = status
    }
    func saveStatus() {
        do{
            let data = try JSONEncoder().encode(books)
            try data.write(to: savePath)
        }
        catch {
            print("Unable to save data \(error)")
        }
    }
    func loadStatus(){
        do{
            let data = try Data(contentsOf: savePath)
            books = try JSONDecoder().decode([Book].self,from: data)
        }
        catch {
            let decodedQuestions : [Question] = decodeQuestions()
            let organizedQuestions : [[Question]] = organizeQuestions(decodedQuestions)
            populateBooks(with: organizedQuestions)
        }
    }
}

