//
//  ToastView.swift
//  DEdemo
//
//  Created by susan ruan on 12/10/24.
//

import SwiftUI

struct ToastView: View {
        let message: String
        let linkText: Text 
        let linkAction: () -> Void
        let image: Image
        let backgroundColor: Color
        let duration: TimeInterval
        
        @Binding var isVisible: Bool
        
        var body: some View {
            if isVisible {
                VStack {
                    Spacer()
                    
                    HStack(spacing: 20) {
                        // Image
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 66, height: 66)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        // Text
                        VStack(alignment: .leading, spacing: 10) {
                            Text(message)
                                .foregroundColor(.white)
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                            
                            // Clickable link
                            Button(action: linkAction) {
                                linkText
                            }
                        }

                        
                        // Close button
                        Button(action: {
                            withAnimation {
                                isVisible = false
                            }
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .padding(2)
                        }
                    }
                    .padding()
                    .background(backgroundColor)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .shadow(radius: 5)
                }
                .transition(.move(edge: .bottom))
                .animation(.easeInOut, value: isVisible)
                .onAppear {
   // Schedule hiding the toast based on `duration`
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        withAnimation {
                            isVisible = false
                        }
                    }
                }
            }
        }
}
