//
//  CardView.swift
//  DEdemo
//
//  Created by susan ruan on 12/13/24.
//
import SwiftUI

struct CardView: View {
    let title: String
    let items: [(icon: String, text: String)] // Each item has an icon name and text
    let iconColor: Color // Icon color for this card

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)

            // List of items
            ForEach(items, id: \.text) { item in
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: item.icon)
                        .foregroundColor(iconColor)
                        .font(.title2)

                    Text(item.text)
                        .font(.body)
                        .foregroundColor(.black)
                }
                .padding(.bottom, 8)
                .frame(maxWidth: .infinity, alignment: .leading)

                Divider() // Adds a line between items
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 4)
        .padding(.horizontal, 16)
    }
}
