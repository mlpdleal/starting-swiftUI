//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Manoel Leal on 15/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    
    var body: some View {
 
        VStack(alignment: .leading, spacing: 20){
            Text("Hello, world!")
            Text("This is inside a stack")
        }
        
        HStack(spacing: 20){
            Text("Hello, world!")
            Text("This is inside a stack")
        }
        
        VStack{
            Spacer()
            Text("First")
            Text("Second")
            Text("Third")
            Spacer()
            Spacer()
        }
        
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 150, height: 160)
                .foregroundColor(.accentColor)
            Circle()
                .frame(width: 15, height: 15)
                .foregroundColor(.white)
        }
        
        ZStack{
            VStack(spacing: 0){
                Color.red
                Color.blue
            }
                
            Text("Your content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }.ignoresSafeArea()
        
       
        LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
        
        LinearGradient(gradient: Gradient(stops: [
            .init(color: .white, location: 0.45),
            .init(color: .black, location: 0.55)]),
                       startPoint: .top, endPoint: .bottom)
        
        RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
        
        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
        
        VStack{
            Button("Button 1") { }
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
            Button("Button 5") { }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            
            Button{
                print("Button was tapped!")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.red)
            }
            
            Button{
                print("Button was tapped!")
            } label: {
                Image(systemName: "pencil")
            }
            
            Button{
                print("Button was tapped!")
            } label: {
                Label("Edit", systemImage: "pencil")
            }
            
            Button("Show Alert"){
                showingAlert = true
            }
            .alert("Important message", isPresented: $showingAlert){
                Button("Delete", role: .destructive){ }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Please read this")
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
