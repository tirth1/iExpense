//
//  AddExpenseItem.swift
//  ExpenseTracker
//
//  Created by Tirth on 10/24/22.
//

import SwiftUI

struct AddExpenseItem: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "personal"
    @State private var amount = 0.0
    
    let types = ["business", "personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let expense = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.insert(expense, at: 0)
                    dismiss()
                }
            }
        }
    }
}

struct AddExpenseItem_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseItem(expenses: Expenses())
    }
}
