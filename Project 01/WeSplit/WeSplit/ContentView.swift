//
//  ContentView.swift
//  WeSplit
//
//  Created by Glenn Hevey on 13/6/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused : Bool
    
    var totalPerPerson: Double {

        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var currencyFormat: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    
                    TextField("Amount", value: $checkAmount, format: currencyFormat)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: currencyFormat)
                } header: {
                    Text("Amount per person")
                }
                
                Section {
                    Text(grandTotal, format: currencyFormat)
                } header: {
                    Text("Total amount (inc Tip)")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
