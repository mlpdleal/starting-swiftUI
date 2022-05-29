//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Manoel Leal on 15/05/22.
//

import SwiftUI


struct Title: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(.white)
    }
}

extension View {
    func titleStyle() -> some View{
        modifier(Title())
    }
}

struct FlagView: View{
    
    var imageName: String
    
    var body: some View{
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var finalScore = 0
    @State private var countQuestion = 0
    @State private var showingReset = false
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var animationAmount = 1.0
    @State private var flagRotation = [1.0, 1.0, 1.0]
    @State private var flagOpacity = [1.0, 1.0, 1.0]
    @State private var flagScale = [1.0, 1.0, 1.0]
    
    var body: some View {
        
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                
                Text("Guess the Flag")
                    .titleStyle()
                
                VStack(spacing: 30){
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3){ number in
                        Button {
                            withAnimation{
                                flagRotation[number] += 360
                                flagOpacity = [0.75, 0.75, 0.75]
                                flagOpacity[number] = 1.0
                                
                                flagScale = [0.8, 0.8, 0.8]
                                flagScale[number] = 1.0
                                flagTapped(number)
                                
                            }
                        } label: {
                            withAnimation(.easeIn(duration: 1.0)){
                                FlagView(imageName: countries[number])
                                    .opacity(flagOpacity[number])
                                    .scaleEffect(flagScale[number])
                                    .rotation3DEffect(.degrees(flagRotation[number]), axis: (x: 0, y: 1, z: 0))
                            }
                   
                        }
                      
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))

                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert("Finish", isPresented: $showingReset){
            Button("Restart", action: askQuestion)
        } message: {
            Text("Your final score is \(finalScore)")
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }

    
    }
    
    func flagTapped(_ number: Int){
        countQuestion += 1
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
        }
        
        if countQuestion == 8 {
            showingReset = true
            finalScore = score
            score = 0
            countQuestion = 0
        }
        
        if showingReset {
            showingScore = false
        } else {
            showingScore = true
        }
        

        
        
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        flagScale = [1.0, 1.0, 1.0]
        flagOpacity = [1.0, 1.0, 1.0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
