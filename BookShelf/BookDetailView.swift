//
//  BookDetailView.swift
//  BookShelf
//
//  Created by Olimpia Compean on 7/29/25.
//

import SwiftUI

struct BookDetailView: View {
    @Bindable var book: Book
    
    var body: some View {
        Form {
            Section("Book Info") {
                TextField("Title", text: $book.title)
                TextField("Author", text: $book.author)
                Stepper("Rating: \(book.rating ?? 0)", value: Binding(
                    get: { book.rating ?? 0 },
                    set: { book.rating = $0 }
                ), in: 0...5)
            }
            Section("Progress") {
                Picker("Total Chapters", selection: Binding(
                    get: { book.totalChapters ?? 0 },
                    set: { book.totalChapters = $0 }
                )) {
                    ForEach(1..<101, id: \.self) { chapterCount in
                        Text("\(chapterCount)")
                    }
                }
                
                Picker("Chapters Read", selection: Binding(
                    get: { book.chaptersRead ?? 0 },
                    set: { book.chaptersRead = $0 }
                )) {
                    ForEach(0..<(book.totalChapters ?? 1), id: \.self) { readCount in
                        Text("\(readCount)")
                    }
                }
                
                ProgressView(value: book.progress)
                    .progressViewStyle(.linear)
                
                Text("Progress: \(Int(book.progress * 100))%")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }        }
        .navigationTitle(book.title)
    }
}

