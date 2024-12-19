//
//  ContentView.swift
//  DEdemo
//
//  Created by susan ruan on 12/4/24.




import SwiftUI

struct ContentView: View {
    @State private var showToast = false
    @Environment(\.colorScheme) var colorScheme
      
      var toastBackgroundColor: Color {
          return colorScheme == .dark ? .gray : .black
      }
      
      var cardBackgroundColor: Color {
             return colorScheme == .dark ? .orange : .white
         }

       private let cardItems: [(icon: String, text: String)] = [
           (icon: "checkmark.circle", text: "First claim this offer. Then enroll by reviewing the terms and conditions."),
           (icon: "checkmark.circle", text: "Schedule an installation for your doorbell and thermostat."),
           (icon: "checkmark.circle", text: "We will give you a call before installation. When they complete installation you will have access.")
       ]

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    
                    Button("Show Toast") {
                        withAnimation {
                            showToast = true
                        }
                    
                    }
                    .padding()
                    
                    
                    // Card View
                    CardView(
                                        title: "What should I expect when I enroll in Home Base Essentials?",
                                        items: cardItems,
                                        iconColor: .green,
                                        backgroundColor: cardBackgroundColor
                                    )
                    
                    NavigationLink("Go to Another Page", value: "AnotherPage") 
//                        .padding()
             
                }
                
                // Toast View
                ToastView(
                    message: "Complete your Vivint offer by scheduling your installation.",
                    linkText: Text("Schedule installation") .font(.subheadline)
                        .foregroundColor(.white).bold(),
                    linkAction: {
                        openWebPage("https://www.vivint.com/")
                    },
                    image: Image("doorbell"),
                    backgroundColor: toastBackgroundColor,
                    duration: 60.0,
                    isVisible: $showToast
                )
                
            
            }
            .navigationTitle("MainPage")
            .navigationDestination(for: String.self) { value in
                if value == "AnotherPage" {
                    AnotherPage()
                }
            }
        }
    }
    
    // Function to open a webpage
    func openWebPage(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL: \(urlString)")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
    
#Preview {
    ContentView()
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}



