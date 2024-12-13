//
//  ModalView.swift
//  DEdemo
//
//  Created by susan ruan on 12/12/24.
//

import SwiftUI

struct CustomModalView: View {
    @Binding var isPresented: Bool // Binding to close the modal

    var body: some View {
        ZStack {
//            Color.green.edgesIgnoringSafeArea(.all)
                        Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)

            VStack {
                Text("This is a modal")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()

                Button("Close Modal") {
                    isPresented = false
                }
                .padding()
                .background(Color.white)
                .foregroundColor(.green)
                .cornerRadius(10)
            }
        }
    }
}
