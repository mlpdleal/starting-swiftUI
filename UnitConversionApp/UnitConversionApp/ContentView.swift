//
//  ContentView.swift
//  UnitConversionApp
//
//  Created by Manoel Leal on 14/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState private var valueIsFocused: Bool
    
    // Temperature variables
    
    @State private var temperature = 0.0
    @State private var unitTemperatureInput = "Celsius"
    @State private var unitTemperatureOutput = "Fahrenheit"
    
    let unitsTemperatures = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertedTemperature: Double{
        
        if unitTemperatureInput == "Celsius" && unitTemperatureOutput == "Fahrenheit"{
            return temperature * 1.8 + 32
        } else if unitTemperatureInput == "Celsius" && unitTemperatureOutput == "Kelvin" {
            return temperature + 273.15
        } else if unitTemperatureInput == "Fahrenheit" && unitTemperatureOutput == "Celsius" {
            return temperature * 0.556 - 32
        } else if unitTemperatureInput == "Fahrenheit" && unitTemperatureOutput == "Kelvin" {
            return ((temperature - 32) * 5) / 9 + 273.15
        } else if unitTemperatureInput == "Kelvin" && unitTemperatureOutput == "Celsius" {
            return temperature - 273.15
        } else if unitTemperatureInput == "Kelvin" && unitTemperatureOutput == "Fahrenheit" {
            return ((temperature - 273.15) * 1.8) + 32
        } else {
            return temperature
        }
        
    }

    var formattedTemperatureSymbol: String {
        
        if unitTemperatureOutput == "Celsius" {
            return "ºC"
        } else if unitTemperatureOutput == "Fahrenheit"{
            return "ºF"
        } else {
            return "K"
        }
        
    }
    
    // --------------------------------------------------------------------------------------------
    
    // Length Variables
    
    @State private var length = 0.0
    @State private var unitLengthInput = "Meters"
    @State private var unitLengthOutput = "Kilometers"
    
    let unitsLength = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    
    var convertedLength: Double {
        
        if unitLengthInput == "Meters" && unitLengthOutput == "Kilometers"{
            return length / 1000
        } else if unitLengthInput == "Meters" && unitLengthOutput == "Feet"{
            return length * 3.28084
        } else if unitLengthInput == "Meters" && unitLengthOutput == "Yards"{
            return length * 1.093613
        } else if unitLengthInput == "Meters" && unitLengthOutput == "Miles"{
            return length / 1_609.344
        } else if unitLengthInput == "Kilometers" && unitLengthOutput == "Meters"{
            return length / 1000
        } else if unitLengthInput == "Kilometers" && unitLengthOutput == "Feet" {
            return length * 3_280.839895
        } else if unitLengthInput == "Kilometers" && unitLengthOutput == "Yards" {
            return length * 1_093.613
        } else if unitLengthInput == "Kilometers" && unitLengthOutput == "Miles" {
            return length * 0.6214
        } else if unitLengthInput == "Feet" && unitLengthOutput == "Meters" {
            return length * 0.3048
        } else if unitLengthInput == "Feet" && unitLengthOutput == "Kilometers"{
            return length * 0.000305
        } else if unitLengthInput == "Feet" && unitLengthOutput == "Yards"{
            return length / 3
        } else if unitLengthInput == "Feet" && unitLengthOutput == "Miles"{
            return length / 5280
        } else if unitLengthInput == "Yards" && unitLengthOutput == "Meters"{
            return length * 0.9144
        } else if unitLengthInput == "Yards" && unitLengthOutput == "Kilometers"{
            return length * 0.0009144
        } else if unitLengthInput == "Yards" && unitLengthOutput == "Feet"{
            return length * 3
        } else if unitLengthInput == "Yards" && unitLengthOutput == "Miles"{
            return length / 1760
        } else if unitLengthInput == "Miles" && unitLengthOutput == "Meters"{
            return length * 1609.344
        } else if unitLengthInput == "Miles" && unitLengthOutput == "Kilometers"{
            return length * 1.609344
        } else if unitLengthInput == "Miles" && unitLengthOutput == "Feet"{
            return length * 5280
        } else if unitLengthInput == "Miles" && unitLengthOutput == "Yards" {
            return length * 1760
        } else {
            return length
        }
        
    }
    
    var formattedLengthSymbol: String {
        
        if unitLengthOutput == "Meters"{
            return "m"
        } else if unitLengthOutput == "Kilometers"{
            return "km"
        } else if unitLengthOutput == "Feet" {
            return "ft"
        } else if unitLengthOutput == "Yards" {
            return "yd"
        } else {
            return "mi"
        }
  
    }
// --------------------------------------------------------------------------------------------------------------
// Time variables
    
    @State private var timeValue = 0.0
    @State private var unitTimeInput = "Seconds"
    @State private var unitTimeOutput = "Minutes"
    
    let unitsOfTime = ["Seconds", "Minutes", "Hours", "Days"]
    
    var convertedTime: Double {
        if unitTimeInput == "Seconds" && unitTimeOutput == "Minutes"{
            return timeValue / 60
        } else if unitTimeInput == "Seconds" && unitTimeOutput == "Hours"{
            return timeValue / 3600
        } else if unitTimeInput == "Seconds" && unitTimeOutput == "Days"{
            return timeValue / 86400
        } else if unitTimeInput == "Minutes" && unitTimeOutput == "Seconds"{
            return timeValue * 60
        } else if unitTimeInput == "Minutes" && unitTimeOutput == "Hours"{
            return timeValue / 60
        } else if unitTimeInput == "Minutes" && unitTimeOutput == "Days"{
            return timeValue / 1440
        } else if unitTimeInput == "Hours" && unitTimeOutput == "Seconds"{
            return timeValue * 3600
        } else if unitTimeInput == "Hours" && unitTimeOutput == "Minutes" {
            return timeValue * 60
        } else if unitTimeInput == "Hours" && unitTimeOutput == "Days" {
            return timeValue / 24
        } else if unitTimeInput == "Days" && unitTimeOutput == "Seconds" {
            return timeValue * 86400
        } else if unitTimeInput == "Days" && unitTimeOutput == "Minutes" {
            return timeValue * 1440
        } else if unitTimeInput == "Days" && unitTimeOutput == "Hours" {
            return timeValue * 24
        } else {
            return timeValue
        }
    }
    
    var formattedTimeSymbol: String {
        if unitTimeOutput == "Seconds"{
            return "s"
        } else if unitTimeOutput == "Minutes" {
            return "m"
        } else if unitTimeOutput == "Hours" {
            return "h"
        } else {
            return "d"
        }
    }
    
// ---------------------------------------------------------------------------------------
// Volume variables
    
    @State private var volume = 0.0
    @State private var unitVolumeInput = "Milliliters"
    @State private var unitVolumeOutput = "Liters"
    
    let unitsVolumes = ["Milliliters", "Liters", "Cups", "Pints", "Gallons"]
    
    var converttedVolume: Double {
        if unitVolumeInput == "Milliliters" && unitVolumeOutput == "Liters"{
            return volume / 1000
        } else if unitVolumeInput == "Milliliters" && unitVolumeOutput == "Cups" {
            return volume * 0.004227
        } else if unitVolumeInput == "Milliliters" && unitVolumeOutput == "Pints"{
            return volume * 0.002113
        } else if unitVolumeInput == "Milliliters" && unitVolumeOutput == "Gallons"{
            return volume * 0.000264
        } else if unitVolumeInput == "Liters" && unitVolumeOutput == "Milliliters"{
            return volume * 1000
        } else if unitVolumeInput == "Liters" && unitVolumeOutput == "Cups" {
            return volume * 4.22675
        } else if unitVolumeInput == "Liters" && unitVolumeOutput == "Pints"{
            return volume * 2.11338
        } else if unitVolumeInput == "Liters" && unitVolumeOutput == "Gallons"{
            return volume * 0.264172
        } else if unitVolumeInput == "Cups" && unitVolumeOutput == "Milliliters"{
            return volume * 236.588236
        } else if unitVolumeInput == "Cups" && unitVolumeOutput == "Liters"{
            return volume * 0.236588
        } else if unitVolumeInput == "Cups" && unitVolumeOutput == "Pints"{
            return volume * 0.5
        } else if unitVolumeInput == "Cups" && unitVolumeOutput == "Gallons"{
            return volume / 16
        } else if unitVolumeInput == "Pints" && unitVolumeOutput == "Milliliters"{
            return volume * 473.176473
        } else if unitVolumeInput == "Pints" && unitVolumeOutput == "Liters"{
            return volume * 0.4731765
        } else if unitVolumeInput == "Pints" && unitVolumeOutput == "Cups"{
            return volume * 2
        } else if unitVolumeInput == "Pints" && unitVolumeOutput == "Gallons"{
            return volume / 8
        } else if unitVolumeInput == "Gallons" && unitVolumeOutput == "Milliliters"{
            return volume * 3785.411784
        } else if unitVolumeInput == "Gallons" && unitVolumeOutput == "Liters"{
            return volume * 3.785411784
        } else if unitVolumeInput == "Gallons" && unitVolumeOutput == "Cups"{
            return volume * 16
        } else if unitVolumeInput == "Gallons" && unitVolumeOutput == "Pints"{
            return volume * 8
        }
        
        else {
            return volume
        }
    }
    
    var formattedVolumeSymbol: String {
        if unitVolumeOutput == "Milliliters"{
            return "ml"
        } else if unitVolumeOutput == "Liters"{
            return "l"
        } else if unitVolumeOutput == "Cups"{
            return "c"
        } else if unitVolumeOutput == "Pints"{
            return "pt"
        } else {
            return "gl"
        }
    }
//----------------------------------------------------------------------------------------
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Temperature", value: $temperature, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)
                        
                    
                    Picker("Temperature Input", selection: $unitTemperatureInput){
                        ForEach(unitsTemperatures, id: \.self){
                            Text("\($0)")
                        }
                    }
                    
                    Picker("Temperature Output", selection: $unitTemperatureOutput){
                        ForEach(unitsTemperatures, id: \.self){
                            Text("\($0)")
                        }
                    }
                    Text("Temperature is: \(convertedTemperature, format: .number) \(formattedTemperatureSymbol)")
                }header: {
                    Text("Temperature Conversion")
                }
                
                Section{
                    TextField("Length", value: $length, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)
                    
                    Picker("Length Input", selection: $unitLengthInput){
                        ForEach(unitsLength, id: \.self){
                            Text("\($0)")
                        }
                    }
                    
                    Picker("Length Output", selection: $unitLengthOutput){
                        ForEach(unitsLength, id: \.self){
                            Text("\($0)")
                        }
                    }
                    
                    Text("Converted length is: \(convertedLength,format: .number) \(formattedLengthSymbol)")

                } header: {
                    Text("Length Conversion")
                }
                
                Section{
                    TextField("Time input", value: $timeValue, format: .number)
                        .keyboardType(.numberPad)
                        .focused($valueIsFocused)
                    
                    Picker("Time Input", selection: $unitTimeInput){
                        ForEach(unitsOfTime, id: \.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Picker("Time Output", selection: $unitTimeOutput){
                        ForEach(unitsOfTime, id: \.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text("Converted time is: \(convertedTime,format: .number) \(formattedTimeSymbol)")
                    
                } header: {
                    Text("Time Conversion")
                }
                
                Section {
                    TextField("Volume input", value: $volume, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)
                    
                    Picker("Time Input", selection: $unitVolumeInput){
                        ForEach(unitsVolumes,id: \.self){
                            Text("\($0)")
                        }
                    }
                    
                    Picker("Time Output", selection: $unitVolumeOutput){
                        ForEach(unitsVolumes, id: \.self){
                            Text("\($0)")
                        }
                    }
                    
                    Text("Converted volume is: \(converttedVolume, format: .number) \(formattedVolumeSymbol)")
                    
                } header: {
                    Text("Volume Conversion")
                }
            }
            .navigationTitle("Unit Conversion")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done"){
                        valueIsFocused = false
                    }
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
	
