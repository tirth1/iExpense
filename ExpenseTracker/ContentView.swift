//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Tirth on 10/24/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddNewExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.id) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                    
                }
                .onDelete(perform: removeItem)
            }
            .navigationTitle("Expense Tracker")
            .toolbar {
                Button {
                    showingAddNewExpense = true
                } label: {
                     Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddNewExpense) {
                AddExpenseItem(expenses: expenses)
            }
        }
    }
    
    func removeItem(offSet: IndexSet) {
        expenses.items.remove(atOffsets: offSet)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
