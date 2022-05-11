//
//  ContentView.swift
//  WeSplit
//
//  Created by Manoel Leal on 11/05/22.
//

import SwiftUI

struct ContentView: View {
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    @State private var tapCount = 0
    @State private var name = ""
    
    
    var body: some View {
        NavigationView{
            
            Form {
                Section{
                    Text("Hello, world!")
                }
                
                Group{
                    Button("Tap Count: \(tapCount)"){
                        tapCount += 1
                    }
                }
                
                Group{
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                }
                
                Group{
                    Picker("Select your student", selection: $selectedStudent){
                        ForEach(students, id: \.self){
                            Text($0)
                        }
                    }
                }
                
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
