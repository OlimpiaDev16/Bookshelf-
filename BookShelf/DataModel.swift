//
//  DataModel.swift
//  BookShelf
//
//  Created by Olimpia Compean on 7/28/25.
//

import SwiftData
import Foundation

@Model
final class Book {
    var title: String
    var author: String
    var rating: Int?
    var totalChapters: Int?
    var chaptersRead: Int?
    var createdAt: Date
    
    var progress: Double {
        guard let total = totalChapters, let read = chaptersRead, total > 0 else {
            return 0
        }
        return Double(read) / Double(total)
    }
    
    init(
        title: String,
        author: String,
        rating: Int? = nil,
        totalChapters: Int? = nil,
        chaptersRead: Int? = nil,
        createdAt: Date = Date()
    ) {
        self.title = title
        self.author = author
        self.rating = rating
        self.totalChapters = totalChapters
        self.chaptersRead = chaptersRead
        self.createdAt = Date()
    }
    
}
