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
    
    @State private var showAlert = false
    @State private var message = ""
    
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
        .navigationTitle("Dodaj bibliotekę")
        .alert(isPresented: $showAlert){
            Alert(
                title: Text(message)
            )
        }
    }
    
    private func saveAuthor() {
        if name.count < 5 {
            showAlert = true
            message = "Imie autora powinno zawierac przynajmniej 3 znakow"
        }
        
        if surname.count < 5 {
            showAlert = true
            message  = "Nazwisko autora powinno zawierac przynajmniej 3 znaki"
        }
        
        if showAlert {
            return
        }
        
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
