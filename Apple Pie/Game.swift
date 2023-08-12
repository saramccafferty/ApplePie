//
//  Game.swift
//  Apple Pie
//
//  Created by Sara on 2/12/2022.
//

import Foundation

struct Game {
    var word: String // The target word to guess
    var incorrectMovesRemaining: Int // Number of incorrect moves allowed
    var guessedLetters: [Character] // List of letters guessed by the player
    
    // Function to handle a player's letter guess
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter) // Add the guessed letter to the list
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1 // Decrement remaining incorrect moves
        }
    }
    
    // Computed property to generate a formatted word for display
    var formattedWord: String {
        var guessedWord = "" // Initialize an empty string to build the formatted word
        // Iterate through each letter in the target word
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)" // If guessed, add the letter to the formatted word
            } else {
                guessedWord += "_" // If not guessed, add an underscore to the formatted word
            }
        }
        return guessedWord // Return the formatted word
    }

}
