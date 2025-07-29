//
//  BookListView.swift
//  BookShelf
//
//  Created by Olimpia Compean on 7/28/25.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Book.createdAt, order: .reverse) private var books: [Book]
    
    @State private var showAddBook = false
    
    var body: some View {
       NavigationStack {
           List {
               ForEach(books) { book in
                   NavigationLink(destination: BookDetailView(book: book)) {
                       VStack(alignment: .leading) {
                           Text(book.title)
                               .font(.headline)
                           Text(book.author)
                               .font(.subheadline)
                               .foregroundColor(.secondary)
                           HStack {
                               if let rating = book.rating {
                                   Text(String(repeating: "⭐️", count: rating))
                                       .font(rating > 3 ? .caption2 : .caption)
                               } else {
                                   Text("No Rating")
                                       .foregroundColor(.secondary)
                               }
                               
                               Spacer()
                               
                               if let read = book.chaptersRead, let total = book.totalChapters {
                                   let percentage = Int((Double(read) / Double(total)) * 100)
                                   Text("\(read)/\(total) Chapters (\(percentage)% Read)")
                                       .font(.caption2)
                                       .foregroundColor(.secondary)
                               } else {
                                   Text("Not Started")
                                       .foregroundColor(.secondary)
                               }                           }
                           ProgressView(value: book.progress)
                               .progressViewStyle(.linear)
                       }
                   }
               }
               .onDelete { indexSet in
                   indexSet.forEach { context.delete(books[$0]) }
                   try? context.save()
               }
           }
           .navigationTitle("My Books")
           .toolbar {
               ToolbarItem(placement: .primaryAction) {
                   Button {
                       showAddBook.toggle()
                   } label: {
                       Image(systemName: "plus")
                   }
               }
           }
           .sheet(isPresented: $showAddBook) {
               AddBookView()
           }
        }
    }
}
