//
//  BooksListView.swift
//  bookManagmentApp
//
//  Created by student on 04/06/2024.
//

import SwiftUI

struct BooksListView: View {
    @ObservedObject var viewModel = BooksListViewModel()

    var body: some View {
        NavigationView{
            // List(viewModel.books){ book in 
            //     NavigationLink(destination: BookView()){
            //         Text("SwiftUI for Beginners")
            //             .font(.title)
            //             .fontWeight(.bold)
            //             .foregroundColor(.primary)

            //         Text("by John Appleseed")
            //             .font(.subheadline)
            //             .foregroundColor(.secondary)
            //     }.navigationTitle("Book")
            // }
            List{ 
                NavigationLink(destination: BookView()){
                    Text("SwiftUI for Beginners")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)

                    Text("by John Appleseed")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }.navigationTitle("Book")
            }
        }
    }
}

#Preview {
    BooksListView()
}
