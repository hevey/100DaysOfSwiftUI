//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Glenn Hevey on 16/6/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var showingGameOver = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var gameCount = 0
    @State private var flagClickedNumber = -1
    @State private var animate = false
    
    @State private var alertMessage = ""
    
    struct FlagImage: View {
        var flag: String
        var flagNumber: Int
        var clickedNumber: Int
        var animate: Bool
        
        var body: some View {
            Image(flag)
                .renderingMode(.original)
                .clipShape(Capsule())
                .shadow(radius: 5)
                .rotation3DEffect(.degrees(animate && (flagNumber == clickedNumber) ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                .opacity(animate && (flagNumber != clickedNumber) ? 0.25 : 1)
                .rotation3DEffect(
                    .degrees(animate && (flagNumber != clickedNumber) ? 180 : 0),
                                          axis: (x: 0.0, y: 0.0, z: 1.0)
                )
                .animation(.default, value: animate)
        }
    }
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            animate = true
                            flagTapped(number)
                        } label: {
                            FlagImage(flag: countries[number], flagNumber: number, clickedNumber: flagClickedNumber, animate: animate)
                        }

                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(alertMessage)
        }
        .alert("Gameover", isPresented: $showingGameOver) {
            Button("Play Again", action: resetGame)
        } message: {
            Text("You scored \(score) out of 8 correct")
        }
    }
    
    func flagTapped(_ number: Int) {
        flagClickedNumber = number
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            alertMessage = "Your score is \(score)"
        } else {
            scoreTitle = "Wrong!"
            alertMessage = "That’s the flag of \(countries[number])"
        }
        
        gameCount += 1
        
        if gameCount < 8 {
            showingScore = true
        } else {
            showingGameOver = true
        }
        
    }
    
    func askQuestion() {
        animate = false
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        score = 0
        gameCount = 0
        askQuestion()
    }
}

#Preview {
    ContentView()
}
