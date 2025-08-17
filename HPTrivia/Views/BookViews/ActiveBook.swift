//
//  ActiveBook.swift
//  HPTrivia
//
//  Created by masume çetin on 18.08.2025.
//

import SwiftUI

struct ActiveBook: View {
    let book: Book
    
    var body: some View {
        ZStack(alignment: .bottomTrailing,){
            Image(book.image)
                .resizable()
                .scaledToFit()
                .shadow(radius: 7)
            
           Image(systemName: "checkmark.circle.fill")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.green)
                .shadow(radius: 1)
                .padding(3)
        }
    }
}

#Preview {
    ActiveBook(book:BookQuestions().books.first!)
        .environment(Game())
}
