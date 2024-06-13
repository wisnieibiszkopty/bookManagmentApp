//
//  AddAuthorView.swift
//  bookManagmentApp
//
//  Created by student on 13/06/2024.
//

import SwiftUI

struct AddAuthorView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var surname: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Informacje o autorze")) {
                    TextField("Imię", text: $name)
                    TextField("Nazwisko", text: $surname)
                }
                
                Button(action: {
                    saveAuthor()
                }) {
                    Text("Zapisz")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
            }
            .navigationTitle("Dodaj autora")
        }
    }
    
    private func saveAuthor() {
        let newAuthor = Author(context: viewContext)
        newAuthor.name = name
        newAuthor.surname = surname
        
        do {
            try viewContext.save()
            print("Zapisano autora: \(newAuthor)")
            presentationMode.wrappedValue.dismiss()
        } catch {
            print("Błąd zapisu: \(error.localizedDescription)")
        }
    }
}


#Preview {
    AddAuthorView()
}
