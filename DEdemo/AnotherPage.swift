//
//  AnotherPage.swift
//  DEdemo
//
//  Created by susan ruan on 12/12/24.
//
import SwiftUI

struct AnotherPage: View {
    @State private var showToast = false
    @State private var showModal = false
    @Environment(\.colorScheme) var colorScheme
    
    var toastBackgroundColorTwo: Color {
           return colorScheme == .dark ? .yellow : .red
       }
       
       var cardBackgroundColorTwo: Color {
              return colorScheme == .dark ? .blue : .green
          }
    
       private let cardItemsTwo: [(icon: String, text: String)] = [
        (icon: "xmark.circle", text: "Review your account settings before proceeding."),
        (icon: "xmark.circle", text: "Make sure your thermostat and devices are connected to power."),
        (icon: "xmark.circle", text: "Contact support if you face issues during installation.")
       ]

    var body: some View {
        ZStack {
            VStack {
                
                // Card View
                CardView(
                                    title: "Steps for Completing Your Setup",
                                    items:cardItemsTwo,
                                    iconColor: .red,
                                    backgroundColor: cardBackgroundColorTwo
                                )

                Button("Show Another Toast") {
                    withAnimation {
                        showToast = true
                    }
                }
                .padding()
                
         
            }
            // Toast View
            ToastView(
                message: "Complete your Vivint offer!",
                linkText: Text("Show Modal")
                    .foregroundColor(.white)
                    .bold(),
                linkAction: {
                    showModal = true
                },
                image: Image("monitor"),
                backgroundColor: toastBackgroundColorTwo,
                duration: 5.0,
                isVisible: $showToast
            )
         
        }
        .navigationTitle("AnotherPage")
        .sheet(isPresented: $showModal) {
            CustomModalView(isPresented: $showModal)
                   }
    }
}

struct AnotherPage_Previews: PreviewProvider {
    static var previews: some View {
        AnotherPage()
    }
}
