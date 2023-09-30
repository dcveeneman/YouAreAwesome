//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by David Veeneman on 9/25/23.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = 0
    @State private var currentMessageNumber = 0
    @State private var lastImageNumber = 0
    @State private var currentImageNumber = 0

     var body: some View {
        
        VStack {
            // Declare Text view
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .padding()
            
            //Declare Image view
            Image(imageName)
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            //Declare Button view
            Button("Show Message") {
                
                let messages = ["You Are Awesome!",
                                "You Are Great!",
                                "Fabulous? That's You!",
                                "You Are Fantastic!"]

                // Select new message, different from the last
                while currentMessageNumber == lastMessageNumber {
                    currentMessageNumber = Int.random(in: 0...3)
                }
                lastMessageNumber = currentMessageNumber
                
                
                messageString = (messages[currentMessageNumber]) // Triggers UI update
                
                // Select new image, different from the last
                while currentImageNumber == lastImageNumber {
                    currentImageNumber = Int.random(in: 1...9)
                    print("Last image number: \(lastImageNumber); Current image number: \(currentImageNumber)")
                }
                lastImageNumber = currentImageNumber

                print("***")

                imageName = "image\(currentImageNumber)" // Triggers UI update
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
