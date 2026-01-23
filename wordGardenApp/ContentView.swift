//
//  ContentView.swift
//  wordGardenApp
//
//  Created by HERNANDEZ-CALIX, KAMILA on 1/16/26.
//

import SwiftUI

struct ContentView: View {
    @State private var wordsGuessed = -0
    @State private var wordsMissed = 0
    @State private var wordsToGuess = ["SWIFT","DOG", "CAT"]//ALL CAPS
    @State private var gameStatusMessage = "How Many Guesses to uncover the Hidden Word?"
    @State private var currentWord = 0 //index in wordsoGuess
    @State private var guessedLetter = ""
    @State private var imageName = "flower8"
    @State private var playAgainHidden = true
    @FocusState private var textFieldIsFocused: Bool
    
    var body: some View {
        VStack {
            HStack{
                VStack(alignment: .leading) {
                    Text("Words Guessed: \(wordsGuessed)")
                    Text("words Missed: \(wordsMissed)")
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Words to Guess\(wordsToGuess.count - (wordsGuessed + wordsMissed))")
                    Text("words to Game: 0\(wordsToGuess.count)")
                }
            }
            .padding(.horizontal)
            Spacer()
            Text(gameStatusMessage)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            //TODO: switch to wordstoguess[currentword]
            Text("_ _ _ _ _")
                .font(.title)
            
            if playAgainHidden {
                HStack {
                    TextField("", text: $guessedLetter)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 30)
                        .overlay{
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 2)
                        }
                        .keyboardType(.asciiCapable)
                        .submitLabel(.done)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.characters)
                        .onChange(of: guessedLetter){
                            guessedLetter =
                            guessedLetter.trimmingCharacters(in: .letters.inverted)
                            guard let lastChar = guessedLetter.last else {
                                return
                            }
                            guessedLetter = String(lastChar).uppercased()
                        }
                        .focused($textFieldIsFocused)
                    
                    Button("Guess a Letter:"){
                        //TODO: Guess a Letter button action here
                        textFieldIsFocused = false
                    }
                    .buttonStyle(.bordered)
                    .tint(.mint)
                    .disabled(guessedLetter.isEmpty)
                }
            } else{
                Button("Another Word?") {
                    // TODO: another word button action here
                 
                }
                .buttonStyle(.borderedProminent)
                    .tint(.mint)
                    
            }
            
    
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

    #Preview {
        ContentView()
    }



