//
//  ViewController.swift
//  Apple Pie
//
//  Created by Sara on 2/12/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    var listOfWords = ["swift", "taylor", "cake", "lover", "cow", "tiger", "lion", "giraffe", "bird", "princess", "dress", "umbrella", "pasta"]
    let incorrectMovesAllowed = 7
    
    // Track total wins and losses
    var totalWins = 0 {
        didSet {
            newRound() // Start a new round when wins change
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound() // Start a new round when losses change
        }
    }
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
            let letter = Character(letterString.lowercased())
            currentGame.playerGuessed(letter: letter)
            updateGameState()
        }
        
    // Update game state based on current game properties
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1 // Increment losses and start new round
            } else if currentGame.word == currentGame.formattedWord {
                totalWins += 1 // Increment wins and start new round
            } else {
            updateUI() // Update UI elements
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound() // Start a new game round when view loads
    }
    
    var currentGame: Game! // The current game instance
    
    // Start a new game round
    func newRound() {
        if !listOfWords.isEmpty {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        enableLetterButtons(true) // Enable letter buttons for input
        updateUI() // Update UI elements
        } else {
            enableLetterButtons(false) // Disable letter buttons when no words left
        }
        
        // Enable or disable letter buttons
        func enableLetterButtons(_ enable: Bool){
            for button in letterButtons {
                button.isEnabled = enable
            }
        }
    }
    
    // Update UI elements based on game state
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
}
    

