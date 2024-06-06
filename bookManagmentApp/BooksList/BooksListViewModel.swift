//
//  BooksListViewModel.swift
//  bookManagmentApp
//
//  Created by student on 04/06/2024.
//

import Foundation

class BooksListViewModel: ObservableObject {
    @Published var books: [String] = []
}