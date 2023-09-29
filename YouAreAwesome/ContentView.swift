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
                let messages = ["You Are Awesome!",
                               "You Are Great!",
                               "Fabulous? That's You!",
                               "You Are Fantastic!"]
                
                let m = Int.random(in: 0...(messages.count - 1))
                messageString = (messages[m])
                let i = Int.random(in: 0...9)
                imageName = "image\(i)"
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
