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
    @Published var description: String = ""
    @Published var returnDate: Date = Date()
    @Published var selectedLibrary: String = ""
    @Published var libraries = ["Biblioteka Miejska", "Biblioteka Uniwersytecka", "Biblioteka Szkolna"]
    
    func saveBook(context: NSManagedObjectContext) {
        let newBook = Book(context: viewContext)
        newBook.title = title
        newBook.genre =
        
        context.save()
    }
}
