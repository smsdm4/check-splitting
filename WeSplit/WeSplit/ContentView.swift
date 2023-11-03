//
//  ContentView.swift
//  WeSplit
//
//  Created by Mojtaba Mirzadeh on 10/29/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    var totalPerPerson: Double {
        
        // calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.numberPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) { person in
                            Text("\(person) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                } //Section
                
                Section("How much tip do you want to leave?") {
                    Picker("Tip precentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) { percentage in
                            Text(percentage, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } //Section
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } //Section
                
            } //Form
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
            
        } //NavigationStack
        
    }
}

#Preview {
    ContentView()
}
