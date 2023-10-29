//
//  ContentView.swift
//  WeSplit
//
//  Created by Mojtaba Mirzadeh on 10/29/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    let students = ["Harry", "Mojtaba", "Alireza", "Hermione", "Ron", "Mohammad", "Ali", "Kamran"]
    @State private var selectedStudent = ""
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                Picker("Select the favorite student:", selection: self.$selectedStudent) {
                    ForEach(self.students, id: \.self) { student in
                        Text(student)
                    }
                }
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.large)
        }
        
    }
}

#Preview {
    ContentView()
}
