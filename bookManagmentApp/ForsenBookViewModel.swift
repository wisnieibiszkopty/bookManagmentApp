//
//  ForsenBookViewModel.swift
//  bookManagmentApp
//
//  Created by student on 04/06/2024.
//

import Foundation

class ForsenBookViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var returnDate: Date = Date()
    @Published var selectedLibrary: String = ""
    @Published var libraries = ["Biblioteka Miejska", "Biblioteka Uniwersytecka", "Biblioteka Szkolna"]
    
    func saveBook() {
//        let newBook = Book(title: title, description: description, returnDate: returnDate, library: selectedLibrary)
//        // Tu dodaj logikę zapisu książki, np. do bazy danych
//        print("Zapisano książkę: \(newBook)")
    }
}
