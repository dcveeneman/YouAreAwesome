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
                let message1 = "You Are Awesome!"
                let message2 = "You Are Great!"
                
                messageString = (messageString == message1 ? message2 : message1)
                
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
