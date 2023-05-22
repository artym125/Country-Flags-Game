//
//  ContentView.swift
//  Country Flags Game
//
//  Created by Ostap Artym on 22.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Аргентина", "Бангладеш", "Бразилія", "Канада", "Китай", "Німеччина", "Греція", "Швеція", "Велика Британія", "США"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white, .yellow, ]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack (spacing: (30)){
                
                VStack(spacing: 20) {
                    Text("Вибери прапор :")
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.black)
                        
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3) {number in
                    Button(action: {
                        self.flagTapped(number)
//                        self.showingScore = true
                    
                    }) {
                        Image(self.countries[number])
//                            .renderingMode(.original)
                            .frame(width: 250, height: 130)
                            .clipShape(Capsule())
//                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
//                            .shadow(color: .black, radius: 2)
                            
                    }
                }
                Text("Ваш рахунок : \(score)")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.black)
                    
                    
                Text("\(scoreTitle)")
                    .foregroundColor(.white)
                    .fontWeight(.black)
                    
                    
                    
//                    .padding()
//                    .background(Color.black)
//                    .clipShape(Capsule())
//                    .overlay(Capsule().stroke(Color.white, lineWidth: 1))
//                    .shadow(color: .white, radius: 2)
                
                
//                Spacer()
            }}.alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message: Text("Ваш рахунок : \(score)"), dismissButton: .default(Text("Продовжити")) {
                    self.asksQuestion()
                })
            }

    }
    func asksQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Правильно"
            score += 1
        } else {
            if score > 0 {
                scoreTitle = "Неправильно!"
                score -= 1
            } else {
                scoreTitle = "Неправильно!"
            }
        }
        asksQuestion()
//        showingScore = true
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
