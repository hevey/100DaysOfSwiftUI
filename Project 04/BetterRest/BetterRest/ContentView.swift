//
//  ContentView.swift
//  BetterRest
//
//  Created by Glenn Hevey on 25/6/2023.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    private var computedBedTime: Date {
        var bedTime = Date.now
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64(hour + minute), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            bedTime = sleepTime
            
        } catch {
            
        }
        
        return bedTime
    }
    
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute).labelsHidden()
                } header: {
                    Text("When do you want to wake up?")
                }
                    
                Section {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                } header: {
                    Text("Desired amount of sleep")
                }
                
                Section {
                    Picker("Cups", selection: $coffeeAmount) {
                        ForEach(1...20, id: \.self) { i in
                            Text(i == 1 ? "1 cup" : "\(i) cups")
                        }
                    }
                } header: {
                    Text("Daily coffee intake")
                }
                
                Section {
                    Text(computedBedTime.formatted(date: .omitted, time: .shortened))
                } header: {
                    Text("Recommended bed time")
                }
            }
            .navigationTitle("BetterRest")
        }
    }
}

#Preview {
    ContentView()
}
