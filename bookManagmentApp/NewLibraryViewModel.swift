//
//  NewLibraryViewModel.swift
//  bookManagmentApp
//
//  Created by student on 04/06/2024.
//

import Foundation

class NewLibraryViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var address: String = ""
    @Published var description: String = ""
    @Published var openingHours: String = ""
    @Published var selectedLocation: IdentifiablePlace? = nil

    func saveLibrary() {
        // Logika zapisu nowej biblioteki
        print("Zapisano bibliotekę: \(name), \(address), \(description), \(openingHours), \(String(describing: selectedLocation))")
    }
}