//
//  ContentView.swift
//  bookManagmentApp
//
//  Created by student on 04/06/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Book.title, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Book>

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Library.name, ascending: true)],
        animation: .default)
    private var libraries: FetchedResults<Library>
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    NavigationLink{
                        ForsenFormView()
                    } label: {
                        Text("Add book")
                    }
                    NavigationLink{
                        NewLibraryView()
                    } label: {
                        Text("Add library")
                    }
                    NavigationLink{
                        AddAuthorView()
                    } label: {
                        Text("Add author")
                    }
                }
                List {
                    ForEach(items) { item in
                        NavigationLink {
                            BookView(book: item)
                        } label: {
                            Text(item.title!)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
                List {
                    ForEach(libraries) { item in
                        Text(item.name!)
                    }
                    .onDelete(perform: deleteItems)
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Book(context: viewContext)
            newItem.title = "tytul"

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
