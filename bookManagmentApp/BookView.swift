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
            Image(.book)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            Text(book.title!)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)

            Text("by \(book.toAuthor!.name!), \(book.toAuthor!.surname!)")
                .font(.subheadline)
                .foregroundColor(.secondary)

            HStack {
                Text("Data oddania:")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Text("\(book.returnDate!)")
                    .font(.footnote)
                    .foregroundColor(.primary)
            }
            
            HStack {
                Text("Gatunek:")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Text(book.genre!)
                    .font(.footnote)
                    .foregroundColor(.primary)
            }

            VStack {
                Text("Library:")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                List {
                    ForEach(book.libraryArray) { item in
                        Text(item.name!)
                    }
//                    .onDelete(perform: deleteItems)
                }
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
