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
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .padding()
            
            Spacer()
            
            Button("Show Message") {
                let message = ["You Are Awesome!",
                               "You Are Great!",
                               "Fabulous? That's You!",
                               "You Are Fantastic!"]
                
                messageString = message[messageNumber]
                messageNumber += 1
                if messageNumber == message.count {
                    messageNumber = 0
                }
                
                imageName = "image\(imageNumber)"
                imageNumber = imageNumber + 1
                if(imageNumber > 9) {
                    imageNumber = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
