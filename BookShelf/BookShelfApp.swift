//
//  BookShelfApp.swift
//  BookShelf
//
//  Created by Olimpia Compean on 7/28/25.
//

import SwiftUI
import SwiftData

@main
struct BookShelfApp: App {
    var body: some Scene {
        WindowGroup {
            BookListView()
        }
        .modelContainer(for: Book.self)
    }
}
