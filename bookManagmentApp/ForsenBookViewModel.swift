//
//  ForsenBookViewModel.swift
//  bookManagmentApp
//
//  Created by student on 04/06/2024.
//

import Foundation
import CoreData

class ForsenBookViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var genre: String = ""
    @Published var returnDate: Date = Date()
    @Published var selectedLibrary: Library? = nil
    @Published var selectedAuthor: Author? = nil


    func saveBook(context: NSManagedObjectContext) throws {
        let newBook = Book(context: context)
        newBook.title = title
        newBook.genre = genre
        newBook.returnDate = returnDate
        newBook.addToToLibrary(selectedLibrary!)
        selectedAuthor?.addToToBook(newBook)
        
        try context.save()
    }
}
