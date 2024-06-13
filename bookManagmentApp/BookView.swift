//
//  BookView.swift
//  bookManagmentApp
//
//  Created by student on 13/06/2024.
//

import SwiftUI

struct BookView: View {
    var book: Book
//    @Environment(\.managedObjectContext) private var viewContext
//    @StateObject private var viewModel: BookViewModel
//
//    init() {
//        _viewModel = StateObject(wrappedValue: BookViewModel(context: viewContext))
//    }

    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
//            HStack{
//                Button(action: viewModel.editBook){
//                    Text("Edit")
//                }
//                Button(action: viewModel.deleteBook){
//                    Text("Delete")
//                }
//            }
            Text(book.title!)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)

            Text("by \(book.toAuthor!.name!), \(book.toAuthor!.surname!)")
                .font(.subheadline)
                .foregroundColor(.secondary)

            HStack {
                Text("Date added:")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Text("June 4, 2024")
                    .font(.footnote)
                    .foregroundColor(.primary)
            }

            HStack {
                Text("Library:")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                //Text("\(book.toLibrary!.name!) \(book.toLibrary!.address!)")
//                if let library = book.toLibrary? {
//                            List(library, id: \.self) { item in
//                                Text(item)
//                            }
//                        } else {
//                            Text("No items in the library")
//                        }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.systemBackground))
                .shadow(radius: 5)
        )
        .padding()
    }
}
