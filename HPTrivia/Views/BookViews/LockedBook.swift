//
//  LockedBook.swift
//  HPTrivia
//
//  Created by masume çetin on 18.08.2025.
//

import SwiftUI

struct LockedBook: View {
    let book : Book
    var body: some View {
        ZStack{
            Image(book.image)
                .resizable()
                .scaledToFit()
                .shadow(radius: 7)
                .overlay {
                    Rectangle().opacity(0.75)
                }
            Image(systemName: "lock.fill")
                 .font(.largeTitle)
                 .imageScale(.large)
                 .shadow(color: .white ,radius: 2)
        }
    }
}

#Preview {
    LockedBook(book : BookQuestions().books.first!)
}
