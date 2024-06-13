//
//  ForsenFormView.swift
//  bookManagmentApp
//
//  Created by student on 04/06/2024.
//

import SwiftUI

struct ForsenFormView: View {
    @ObservedObject var viewModel = ForsenBookViewModel()
        
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Informacje o książce")) {
                    TextField("Tytuł", text: $viewModel.title)
                    TextField("Krótki opis", text: $viewModel.description)
                }
                
                Section(header: Text("Szczegóły wypożyczenia")) {
                    DatePicker("Data oddania", selection: $viewModel.returnDate, displayedComponents: .date)
                    
                    Picker("Biblioteka", selection: $viewModel.selectedLibrary) {
                        ForEach(viewModel.libraries, id: \.self) { library in
                            Text(library)
                        }
                    }
                }
                
                Button(action: {
                    viewModel.saveBook()
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
