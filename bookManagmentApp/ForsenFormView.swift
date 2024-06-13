//
//  ForsenFormView.swift
//  bookManagmentApp
//
//  Created by student on 04/06/2024.
//

import SwiftUI

struct ForsenFormView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = ForsenBookViewModel()
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Library.name, ascending: true)],
        animation: .default)
    private var libraries: FetchedResults<Library>
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Author.name, ascending: true)],
        animation: .default)
    private var authors: FetchedResults<Author>
        
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Informacje o książce")) {
                    TextField("Tytuł", text: $viewModel.title)
                    TextField("Gatunek", text: $viewModel.genre)
                    Picker("Autor", selection: $viewModel.selectedAuthor) {
                        Text("-").tag(nil as Author?)
                        ForEach(authors) { author in
                            Text("\(author.name!) \(author.surname!)").tag(author as Author?)
                        }
                    }
                }
                
                Section(header: Text("Szczegóły wypożyczenia")) {
                    DatePicker("Data oddania", selection: $viewModel.returnDate, displayedComponents: .date)
                    
                    Picker("Biblioteka", selection: $viewModel.selectedLibrary) {
                        Text("-").tag(nil as Library?)
                        ForEach(libraries) { library in
                            Text(library.name!).tag(library as Library?)
                        }
                    }
                }
                
                Button(action: {
                    do {
                        try viewModel.saveBook(context: viewContext)
                        presentationMode.wrappedValue.dismiss()
                    } catch {

                    }
                }) {
                    Text("Zapisz")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
            }
            .navigationTitle("Dodaj książkę")
        }
    }
}

#Preview {
    ForsenFormView()
}
