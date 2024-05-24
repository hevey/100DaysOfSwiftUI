//
//  ContentView.swift
//  iExpense
//
//  Created by Glenn Hevey on 19/5/2024.
//

import SwiftUI


struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let currencyCode: String
}

@Observable
class Expenses {
    var personalItems = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(personalItems) {
                UserDefaults.standard.set(encoded, forKey: "PersonalItems")
            }
        }
    }
    
    var businessItems = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(businessItems) {
                UserDefaults.standard.set(encoded, forKey: "BusinessItems")
            }
        }
    }
    
    init() {
        setPersonalItems()
        setBusinessItems()
    }
    
    func setPersonalItems() {
        if let savedItems = UserDefaults.standard.data(forKey: "PersonalItems") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                personalItems = decodedItems
                return
            }
        }
        
        personalItems = []
    }
    
    func setBusinessItems() {
        if let savedItems = UserDefaults.standard.data(forKey: "BusinessItems") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                businessItems = decodedItems
                return
            }
        }
        
        businessItems = []
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
   
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal Expenses") {
                    ForEach(expenses.personalItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: item.currencyCode))
                                .bold(item.amount > 100)
                                .italic(item.amount > 10)
                        }
                    }
                    .onDelete(perform: removePersonalItems)
                }
                Section("Business Expenses") {
                    ForEach(expenses.businessItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: item.currencyCode))
                                .bold(item.amount > 100)
                                .italic(item.amount > 10)
                        }
                    }
                    .onDelete(perform: removeBusinessItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removePersonalItems(as offsets: IndexSet) {
        expenses.personalItems.remove(atOffsets: offsets)
    }
    
    func removeBusinessItems(as offsets: IndexSet) {
        expenses.businessItems.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
