//
//  ToastView.swift
//  bookManagmentApp
//
//  Created by student on 13/06/2024.
//

import SwiftUI

struct ToastView: View {
    let message: String

    var body: some View {
        Text(message)
            .foregroundColor(.white)
            .padding()
            .background(Color.black.opacity(0.7))
            .cornerRadius(8)
            .padding(.horizontal, 20)
    }
}

#Preview {
    ToastView(message: "twoja stara")
}
