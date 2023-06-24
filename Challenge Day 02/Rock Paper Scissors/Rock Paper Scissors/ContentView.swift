//
//  ContentView.swift
//  Rock Paper Scissors
//
//  Created by Glenn Hevey on 19/6/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var currentChoice = 0
    @State private var winOrLose = false
    @State private var score = 0
    @State private var gameCount = 0
    @State private var turnFinished = false
    @State private var gameOver = false
    
    let moves = ["Rock", "Paper", "Scissors"]
    let winningMoves = ["Paper", "Scissors", "Rock"]
    
    var body: some View {
        VStack {
            Text("Your score: \(score)")
            Text("Apps move: \(moves[currentChoice])")
            if winOrLose {
                Text("You should win")
            } else {
                Text("You should lose")
            }
            HStack {
                Button("🪨") {
                    turn(playerChoice: 2)
                }
                .font(.system(size: 50))
                Button("📄") {
                    turn(playerChoice: 0)
                }
                .font(.system(size: 50))
                Button("✂️") {
                    turn(playerChoice: 1)
                }
                .font(.system(size: 50))
            }
        }
        .alert("Turn over", isPresented: $turnFinished) {
            Button("Next Turn") {
                newGame()
            }
        } message: {
            Text("Next turn")
        }
        .alert("Gameover", isPresented: $gameOver) {
            Button("New Game") {
                reset()
            }
        } message: {
            Text("Start a new game")
        }
    }
    
    func newGame() {
        currentChoice = Int.random(in: 0..<3)
        winOrLose.toggle()
    }
    
    func reset() {
        currentChoice = Int.random(in: 0..<3)
        winOrLose = Bool.random()
        gameCount = 0
        score = 0
    }
    
    func turn(playerChoice: Int) {
        if  currentChoice == playerChoice {
            if winOrLose {
                score += 1
            } else {
                score -= 1
            }
        } else {
            if winOrLose {
                score -= 1
            } else {
                score += 1
            }
        }
        
        gameCount += 1
        
        if gameCount < 10 {
            turnFinished = true
        } else {
            gameOver = true
        }
    }
}

#Preview {
    ContentView()
}
