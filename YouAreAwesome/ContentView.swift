//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by David Veeneman on 9/25/23.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var messageString = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    
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
                .cornerRadius(30)
                .shadow(radius: 30)
                .padding()
            
            Spacer()
            
            Button("Show Message") {
                let messages = ["You Are Awesome!",
                                "You Are Great!",
                                "You Are Fantastic!",
                                "Fabulous? That's You!"]
                
                let messageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: messages.count - 1)
                messageString = messages[messageNumber]
                lastMessageNumber = messageNumber
                
                let imageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: 9)
                 imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
                let soundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: 5)
                playSound(soundName: "sound\(soundNumber)")
                lastSoundNumber = soundNumber
            }
            
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBound: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastNumber
         return newNumber
    }

    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("􀀳 Could not read sound file named \(soundName)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("􀀳 ERROR: \(error.localizedDescription) creating audio player.")
        }
    }
}

#Preview {
    ContentView()
}
