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
    @State private var imageNumber = 0
    @State private var messageNumber = 0
    
    var body: some View {
        
        VStack {
            
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .padding()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            Button("Show Message") {
                // Select new message, different from the last
                var lastMessage = 0
                var currentMessage = 0
                let messages = ["You Are Awesome!",
                                "You Are Great!",
                                "Fabulous? That's You!",
                                "You Are Fantastic!"]
                while currentMessage == lastMessage {
                    lastMessage = currentMessage
                    currentMessage = Int.random(in: 0...3)
                }
                messageString = (messages[currentMessage]) // Triggers UI update

                // Select new image, different from the last
                var lastImage = 0
                var currentImage = 0
                while currentImage == lastImage {
                    lastImage = currentImage
                    currentImage = Int.random(in: 1...9)
                }
                imageName = "image\(currentImage)" // Triggers UI update

                let i = Int.random(in: 0...9)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
