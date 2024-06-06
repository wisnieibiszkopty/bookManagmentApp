//
//  BookView.swift
//  bookManagmentApp
//
//  Created by student on 04/06/2024.
//

import SwiftUI

struct BookView: View {
    @ObservedObject var viewModel = BookViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack{
                Button(action: viewModel.editBook()){
                    Text("Edit")
                }
                Button(action: viewModel.deleteBook()){
                    Text("Delete")
                }
            }
            Text("SwiftUI for Beginners")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)

            Text("by John Appleseed")
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
                Text("City Library")
                    .font(.footnote)
                    .foregroundColor(.primary)
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

#Preview {
    BookView()
}
