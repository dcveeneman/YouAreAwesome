//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by David Veeneman on 9/25/23.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = ""

    var body: some View {
        VStack {
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
            
            HStack {
                Button("Awesome") {
                    // This is the action performed when the button is pressed
                    messageString = "You Are Awesome!"
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
                Button("Great") {
                    messageString = "You Are Great!"
                }
                .buttonStyle(.borderedProminent)
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
