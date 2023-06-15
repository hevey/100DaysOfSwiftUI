//
//  ContentView.swift
//  ChallangeDay01
//
//  Created by Glenn Hevey on 14/6/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var inputTime: Double = 0
    @State private var inputType: TimeEnum = .hour
    @State private var outputType: TimeEnum = .minute
    @FocusState private var inputIsFocused : Bool
    
    var computedInput: Double {
        switch inputType {
        case .hour:
            return inputTime * 60 * 60
        case .minute:
            return inputTime * 60
        case .second:
            return inputTime
        }
    }
    
    private var computedOutput: Double {
        switch outputType {
        case .hour:
            return computedInput / 60 / 60
        case .minute:
            return computedInput / 60
        case .second:
            return computedInput
        }
    }
    
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $inputTime, formatter: formatter)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                    
                    Picker("Input Type", selection: $inputType) {
                        ForEach(TimeEnum.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                } header: {
                    Text("Input")
                }
                
                Section {
                    Picker("Output Type", selection: $outputType) {
                        ForEach(TimeEnum.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                } header: {
                    Text("Output")
                }
                
                Section {
                    Text(computedOutput.formatted())
                } header: {
                    Text("Converted Time")
                }
            }
            .navigationTitle("Time Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
