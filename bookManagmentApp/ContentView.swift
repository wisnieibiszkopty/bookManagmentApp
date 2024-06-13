//
//  ContentView.swift
//  bookManagmentApp
//
//  Created by student on 04/06/2024.
//

// zanies klucz do 118

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

    @State private var libraryToDelete: Library?

    @State var showAlert = false

    var body: some View {

        NavigationView {
            VStack{
                HStack{
                    NavigationLink{
                        ForsenFormView()
                    } label: {
                        Text("Add book ")
                            .frame(width: UIScreen.main.bounds.width * 0.19)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    NavigationLink{
                        NewLibraryView()
                    } label: {
                        Text("Add library")
                            .frame(width: UIScreen.main.bounds.width * 0.21)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    NavigationLink{
                        AddAuthorView()
                    } label: {
                        Text("Add author")
                            .frame(width: UIScreen.main.bounds.width * 0.25)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()

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
                List {
                    ForEach(libraries) { item in
                        Text(item.name!)
                        .onLongPressGesture {
                            self.libraryToDelete = item
                            showAlert = true
                        }
                    }
                }
                .alert(isPresented: $showAlert){
                    Alert(
                        title: Text("Czy na pewno chcesz usunac biblioteke?"),
                        primaryButton: .destructive(Text("Usuń"), action: {
                            if let library = self.libraryToDelete {
                                deleteLibrary(library)
                            }
                        }),
                        secondaryButton: .cancel(Text("Anuluj"))
                    )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.indigo)
        }

    }

    private func addItem() {
        withAnimation {
            let newItem = Book(context: viewContext)
            newItem.title = "tytul"

            do {
                try viewContext.save()
            } catch {
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
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    func deleteLibrary(_ library: Library){
        viewContext.delete(library)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
