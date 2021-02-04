//
//  ContentView.swift
//  Shared
//
//  Created by P.M. Student on 2/2/21.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    // implicitly Unwrapped Optional
    @State var audioPlayer: AVAudioPlayer!
    @State var song = 1
    
    var body: some View {
        VStack {
            HStack {
                Text("Music Player")
                    .font(.system(size: 45))
                    .bold()
                    .foregroundColor(.black)
            }
            
            HStack {
                Button(action: {
                    audioPlayer.play()
                }) {
                    Text("Play")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.gray)
                }
                Button(action: {
                    audioPlayer.pause()
                }) {
                    Text("Pause")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.gray)
                }
                Button(action: {
                    audioPlayer.stop()
                }) {
                    Text("Stop")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.red)
                    
                    Button(action: {
                        if self.song < 3 {
                            self.song += 1
                        } else {
                            self.song = 1
                        }
                        let sound = Bundle.main.path(forResource: "song\(self.song)", ofType: "mp3")
                            audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath:sound!))
                        audioPlayer.play()
                    }) {
                        Text("Next")
                            .font(.system(size: 25))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                    
                }
                .onAppear() {
                let sound = Bundle.main.path(forResource: "song1", ofType: "mp3")
                audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
